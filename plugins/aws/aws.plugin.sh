# aws stuff
if [ -f "/usr/bin/aws_completer" ]; then
  complete -C '/usr/bin/aws_completer' aws
else
  echo "no AWS completion found, install aws-cli first"
  exit 127
fi
function _awsListAll() {

    credentialFileLocation=${AWS_SHARED_CREDENTIALS_FILE};
    if [ -z $credentialFileLocation ]; then
        credentialFileLocation=~/.aws/credentials
    fi

    while read line; do
        if [[ $line == "["* ]]; then echo "$line"; fi;
    done < $credentialFileLocation;
};

function _awsSwitchProfile() {
   if [ -z $1 ]; then  echo "Usage: awsp profilename"; return; fi

   exists="$(aws configure get aws_access_key_id --profile $1)"
   if [[ -n $exists ]]; then
       export AWS_DEFAULT_PROFILE=$1;
       export AWS_PROFILE=$1;
       export AWS_REGION=$(aws configure get region --profile $1);
       echo "Switched to AWS Profile: $1";
       aws configure list
   fi
};

alias awsall="_awsListAll"
alias awsp="_awsSwitchProfile"
alias awswho="aws configure list"
