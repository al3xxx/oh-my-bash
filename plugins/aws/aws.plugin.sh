# aws stuff
if [ -f "/usr/bin/aws_completer" ]; then
  complete -C '/usr/bin/aws_completer' aws
else
  echo "no AWS completion found, install aws-cli first"
  #exit 127
fi
function _awsListAll() {

    credentialFileLocation=${AWS_SHARED_CREDENTIALS_FILE};
    if [ -z "$credentialFileLocation" ]; then
        credentialFileLocation=~/.aws/credentials
    fi

    while read -r line; do
        if [[ $line == "["* ]]; then echo "$line"; fi;
    done < "$credentialFileLocation";
};

function _awsSwitchProfile() {
   if [ -z "$1" ]; then  echo "Usage: awsp profilename"; return; fi
     # Do not clear existing profile vars 
     # $(env | awk -F= '/AWS_/ {print "unset "$1}')
   awsprofile="$1"

   exists="$(aws configure get aws_access_key_id --profile "$awsprofile")"
   role="$(aws configure get role_arn --profile "$awsprofile")"
   source_profile="$(aws configure get source_profile --profile "$awsprofile")"
   # we have source profile and role - need to load source profile first
   if [[ ( -n "$source_profile" ) && ( -n "$role" ) ]]; then
     exists=$source_profile
     roleprofile=$awsprofile
     awsprofile=$sorce_profile
   fi  
   if [[ -n "$exists" ]]; then
       export AWS_PROFILE="$awsprofile";
       export AWS_REGION=$(aws configure get region --profile "$awsprofile");
       #export AWS_ROLE_SESSION_NAME=$(aws configure get role_session_name --profile $awsprofile);
       #export AWS_DEFAULT_PROFILE=$(aws configure get default_profile --profile $awsprofile)
       if [[ -z "$AWS_DEFAULT_PROFILE" ]]; then export AWS_DEFAULT_PROFILE="$AWS_PROFILE"; fi
       
       [[ -n "$role" ]] || (echo "Switched to AWS Profile: $awsprofile"; aws configure list)
   fi
   # if there is role we need to assume it
   if [[ -n "$role" ]]; then
       export AWS_DEFAULT_PROFILE=$roleprofile
       export AWS_PROFILE=$roleprofile
       [[ -n "$role" ]] && (echo "Switched to AWS Profile: $roleprofile"; aws configure list)
   fi  
};          

function _unsetSTS() {
source <(env | awk -F= ' /AWS/ {print "unset ", $1} ')
  return
};

function _become() {
  declare accnum=$1
  declare defprofile=${2:-proits}
  declare rolename=${3:-itadm}
  declare sesname=${4:-aklymov}
  source <(AWS_PROFILE=${defprofile}  aws sts assume-role \
  --role-arn arn:aws:iam::${accnum}:role/${rolename} \
  --role-session-name "$sesname"  | \
  jq -r  '.Credentials | \
  @sh "export AWS_SESSION_TOKEN=\(.SessionToken)\nexport AWS_ACCESS_KEY_ID=\(.AccessKeyId)\nexport AWS_SECRET_ACCESS_KEY=\(.SecretAccessKey) "')
};

alias unsetaws="_unsetSTS"
alias awsenv=$'source <(env |egrep AWS_)'
alias awsall="_awsListAll"
alias awsls="_awsListAll"
alias awsp="_awsSwitchProfile"
alias awswho="aws configure list"
