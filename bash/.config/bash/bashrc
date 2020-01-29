
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
export EDITOR='vim'

#Enable vi-editor-mode in bash
set -o vi

#Local binaries
export PATH=$PATH:$HOME/.local/bin

#GCC, NRF, Segger toolchain PATH
#export PATH=$PATH:/usr/share/segger_embedded_studio_for_arm_3.40/bin
#export PATH=$PATH:$HOME/build/gcc-arm-none-eabi-7-2017-q4-major/bin
#export PATH=$PATH:$HOME/build/nrfjprog
#export PATH=$PATH:$HOME/build/mergehex
#export PATH=$PATH:$HOME/build/cmake-3.12.0-rc1/bin
#export SDK_ROOT=/home/timgremalm/projects/til-firmware/nRF5_SDK_15.0.0_a53641a

#Atmel sam-ba flasher
#export PATH=$PATH:$HOME/build/sam-ba_3.2.1
#export PATH=$PATH:$HOME/build/sam-ba_3.2.3

#ESP toolchain
#export PATH=$PATH:$HOME/build/xtensa-esp32-elf/bin
#export PATH=$PATH:$HOME/build/esp-idf/tools
#export IDF_PATH=$HOME/build/esp-idf

#Programs
#export PATH=$PATH:$HOME/build/eclipse/cpp-oxygen/eclipse
#export PATH=$PATH:$HOME/build/SaleaeLogic
#export PATH=$PATH:$HOME/Android/Sdk/platform-tools
#export PATH=$PATH:$HOME/Android/Sdk/tools/bin

#Stop warnings about "Couldn't register with accessibility bus"
#Even without accessibility enabled, many Gnome components try to connect to the AT-SPI bus.
export NO_AT_BRIDGE=1

#Enable powerline
#if [ -f $HOME/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh ]; then
#	. $HOME/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh
#fi

#export DISPLAY=:0
#export DISPLAY=:1					X screen main
#export DISPLAY=:1.1				X screen secondary 
#export DISPLAY=192.168.0.10:0.0	X screen used if SSH forwarding X window

#For adding python libraries
#export PYTHONPATH=${PYTHONPATH}:$HOME/projects/pylibs

