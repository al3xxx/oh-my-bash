# Miscellaneous aliases
alias c='clear'
alias cls='clear'
alias h='history'
alias hg='history | grep '
alias aag='alias | grep '
alias path='echo $PATH'
alias reload="source $HOME/.bashrc"
alias _="sudo "
alias __="sudo !!"
alias zz="sudo -i" 
alias become="sudo -i -u "
alias svi="sudo vi " 
alias svim="sudo vim " 
alias powertop="sudo powertop"
# vim plugin install
alias vpi="vim +PluginInstall +qall"
alias qq="exit"
alias ll="less"
#   ---------------------------------------
#   7.  DATE & TIME MANAGEMENT
#   ---------------------------------------

alias bdate="date '+%a, %b %d %Y %T %Z'"
alias cal='cal -3'
alias da='date "+%Y-%m-%d %A    %T %Z"'
alias daysleft='echo "There are $(($(date +%j -d"Dec 31, $(date +%Y)")-$(date +%j))) left in year $(date +%Y)."'
alias epochtime='date +%s'
alias mytime='date +%H:%M:%S'
alias secconvert='date -d@1234567890'
alias stamp='date "+%Y%m%d%a%H%M"'
alias tstamp='date "+%Y%m%d%H%M%S"'
alias today='date +"%A, %B %-d, %Y"'
alias weeknum='date +%V'


#   ---------------------------
#   5.  NETWORKING
#   ---------------------------
alias netc='lsof -Pni'                       # netc:   Show all my open TCP/IP sockets, no resolving
alias lsock='sudo lsof -i -P'                # lsock:        Display open sockets systemwide
alias lsofu='sudo lsof -nP | grep UDP'       # lsockU:       Display only open UDP sockets
alias lsoft='sudo lsof -nP | grep TCP'       # lsockT:       Display only open TCP sockets
alias lsofl='sudo lsof -Pni | grep LISTEN'   # openPorts:    All listening connections

#   ---------------------------
#   3.  SEARCHING
#   ---------------------------

alias qfn="find . -name "                 # qfind:    Quickly search for file
alias esse="grep -vE '^$|^#' "
alias cdm='sudo dmesg -c > /dev/null'
alias tdm='sudo dmesg|tail -50' # tail screenful of info
alias sshfs='sshfs -o cache=yes \
 -o kernel_cache \
 -o max_conns=4 '
# typos
alias mroe='more'
alias grpe='grep'
alias cd..='cd ..'
