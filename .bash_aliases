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
alias laptop='xrandr --output eDP-1 --auto --output VGA-1 --off --output HDMI-1 --off'
alias monitor='xrandr --output eDP-1 --off --output VGA-1 --auto --output HDMI-1 --off'
alias dual='xrandr --output eDP-1 --auto --left-of VGA-1 --output VGA-1 --auto --output HDMI-1 --off'
alias monitorhdmi='xrandr --output eDP-1 --off --output VGA-1 --off --output HDMI-1 --auto'
alias dualhdmi='xrandr --output eDP-1 --auto --left-of HDMI-1 --output VGA-1 --off --output HDMI-1 --auto'

