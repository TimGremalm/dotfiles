
#Enable a more color rich terminal experience
export TERM="xterm-256color"

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

#Enables terminal to handle Ctrl+S, first check if interactive shell
if [ "$-" ]; then # term test?
	# Turn off TTY "start" and "stop" commands in all interactive shells.
	# They default to C-q and C-s, Bash uses C-s to do a forward history search.
	stty start ''
	stty stop  ''
	stty -ixon -ixoff # disable XON/XOFF flow control
	stty ixoff # enable sending (to app) of start/stop characters
	stty ixany # let any character restart output, not only start character
fi

#Change that strong blue to mild when listing directories
LS_COLORS=$LS_COLORS:'di=0;96:'
export LS_COLORS

export editor='vim'

#Enable vi-editor-mode in bash
set -o vi

export PATH=$PATH:$HOME/bin

#Enable powerline
if [ -f /usr/local/lib/python2.7/dist-packages/powerline/bindings/bash/powerline.sh ]; then
	. /usr/local/lib/python2.7/dist-packages/powerline/bindings/bash/powerline.sh
fi

export DISPLAY=:0
#export DISPLAY=192.168.0.10:0.0

