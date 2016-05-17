alias q='exit'
alias h='history'
alias lsd='ls -l|grep "^d" | more'
alias cls='clear'
alias p='ping -c4 google.se'
alias vi='vim $@'

#Git aliases
alias gs='git status'
alias gb='git push backup --all -f'
alias gs='git status'
alias gc='git commit'
alias ga='git add'
alias gfa='git fetch --all'
alias gsl='git stash list'
alias gsa='gsa.sh $*'

#Nice quick aliases for common xrandr configurations
alias laptop='xrandr --output LVDS1 --auto --output VGA1 --off'
alias monitor='xrandr --output LVDS1 --off --output VGA1 --auto'
alias dual='xrandr --output LVDS1 --auto --left-of VGA1 --output VGA1 --auto'

