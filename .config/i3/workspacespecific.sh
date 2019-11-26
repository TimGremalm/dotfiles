#!/bin/bash
main=":1"
secondary=":1.1"
log=~/.config/i3/workspacespecific.log
echo 
echo 
logstart=$(date --iso-8601=minutes)
echo Running i3 complementary workspacespecific.sh $logstart
echo Display is now $DISPLAY
if [ "$DISPLAY" == "$main" ]; then
	echo "It's main, sleep 3 seconds"
	sleep 3
	echo "Continue from sleep and do startup"
	#Trayfield stuff
	#===============
	#Most of the rows here is just a reminder and have to be conmfigured individually per host

	#network manager
	nm-applet &

	#keyboard indicator
	#/usr/lib/i386-linux-gnu/indicator-keyboard/indicator-keyboard-service --use-gtk

	#exec --no-startup-id bluetooth-applet
	#exec --no-startup-id /usr/sbin/bluetoothd
	#exec --no-startup-id /usr/lib/i386-linux-gnu/indicator-bluetooth/indicator-bluetooth-service
	dropbox start &

	#Prevent screen blanking
	xset s off &
	xset -dpms &
	xset s noblank &

	#Turn on numlock
	numlockx on &

	#Set position of monitors
	#exec --no-startup-id xrandr --output DVI-D-0 --off --output HDMI-0 --mode 1920x1080 --pos 3000x0 --rotate normal --output DP-5 --mode 1920x1080 --pos 0x0 --rotate left --output DP-4 --off --output DP-3 --mode 1920x1080 --pos 1080x0 --rotate normal --output DP-2 --off --output DP-1 --off --output DP-0 --mode 1920x1080 --pos 1080x1080 --rotate normal
	#Map touch screen
	#exec --no-startup-id xinput --map-to-output 9 DP-0

	#Automount tool for drives
	#exec --no-startup-id udisks-glue

	#Sound indicator
	#exec --no-startup-id /usr/lib/x86_64-linux-gnu/indicator-sound/indicator-sound-service

	#Desktop background for i3
	#nitrogen --restore &
	feh --bg-fill ~/Pictures/Apollo_17_Moon_Panorama.jpg

	#Synery remote control
	#exec --no-startup-id synergy

	#Powerline daemon to cache data
	powerline-daemon -q &
fi

if [ "$DISPLAY" == "$secondary" ]; then
	echo "It's secondary"
	# Kill old xterm
	pkill xterm
	# Open new xterm and create/attach session secondary
	DISPLAY=:1.1 xterm -e tmux new-session -A -s secondary &
fi

