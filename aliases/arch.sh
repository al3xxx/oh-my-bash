# Archlinux related alaiases
# mostly package management
# using yay or yay or expac
alias pacman='sudo pacman'
alias lips='sudo expac -H M "%m\t%n" | sort -h' # List Installed Packages w/ Size
alias psu='pikaur -Syu' # whats new
alias psc='pikaur -Sc ' # clean local package cache
alias prc='pikaur -Rc ' # remove it 
alias prs='pikaur -Rs ' # remove it 
alias prcsn='pikaur -Rcsn ' # remove it completely with dependencies
alias pss='pikaur -Ss ' #search it 
alias psos='pikaur -Sos ' #search it in system repos
alias pqs='pikaur -Qs ' #search installed
alias pki='pikaur -S --needed ' #install it if it's not there
alias pkir='pikaur -S --rebuild ' #install it 
alias pkia='pikaur -S -a ' #install it only from AUR
alias psi='pikaur -Si ' #more info about it
alias pqi='pikaur -Qi ' # info about installed
alias pql='pikaur -Ql ' # list installed pkg files
alias pqo='pikaur -Qo ' # find which package own the file
