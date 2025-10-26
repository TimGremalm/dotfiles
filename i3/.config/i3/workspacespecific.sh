#!/bin/bash
#main=":1"
main=":0"
secondary=":1.1"
echo 
echo 
logstart=$(date --iso-8601=minutes)
echo "Running i3 complementary workspacespecific.sh $logstart"
echo "Display is now $DISPLAY"
if [ "$DISPLAY" == "$main" ]; then
	echo "It's main DISPLAY, sleep 3 seconds to let i3 init"
	sleep 3
	echo "Continue and start utilities"
	#Trayfield stuff
	#===============
	#Most of the rows here is just a reminder and have to be conmfigured individually per host

	echo "Network manager"
	nm-applet &

	#echo "Keyboard indicator"
	#/usr/lib/i386-linux-gnu/indicator-keyboard/indicator-keyboard-service --use-gtk

	#exec --no-startup-id bluetooth-applet
	#exec --no-startup-id /usr/sbin/bluetoothd
	#exec --no-startup-id /usr/lib/i386-linux-gnu/indicator-bluetooth/indicator-bluetooth-service
	#dropbox start &

	echo "Prevent screen blanking"
	xset s off &
	xset -dpms &
	xset s noblank &

	echo "Turn on numlock"
	numlockx on &

	#echo "Set position of monitors"
	#exec --no-startup-id xrandr --output DVI-D-0 --off --output HDMI-0 --mode 1920x1080 --pos 3000x0 --rotate normal --output DP-5 --mode 1920x1080 --pos 0x0 --rotate left --output DP-4 --off --output DP-3 --mode 1920x1080 --pos 1080x0 --rotate normal --output DP-2 --off --output DP-1 --off --output DP-0 --mode 1920x1080 --pos 1080x1080 --rotate normal
	xrandr --output DVI-I-1 --primary --mode 1680x1050 --pos 0x0 --rotate normal --output DP-1 --mode 1680x1050 --pos 3600x0 --rotate normal --output DP-2 --mode 1920x1080 --pos 1680x0 --rotate normal --output DP-3 --off --output HDMI-1 --off --output HDMI-A-1-1 --off --output DisplayPort-1-3 --off --output DisplayPort-1-4 --off --output DisplayPort-1-5 --off

	#echo "Map touch screen"
	#exec --no-startup-id xinput --map-to-output 9 DP-0
	xsetwacom set 13 MapToOutput DP-2

	#echo "Automount tool for drives"
	#exec --no-startup-id udisks-glue

	#echo "Sound indicator"
	#exec --no-startup-id /usr/lib/x86_64-linux-gnu/indicator-sound/indicator-sound-service

	#echo "Desktop background for i3"
	#nitrogen --restore &
	#feh --bg-fill ~/Pictures/Apollo_17_Moon_Panorama.jpg
	#feh --bg-fill ~/Pictures/black.jpg
	feh --bg-fill ~/Pictures/plain-black-desktop.jpg

	#echo "Synery remote control"
	#exec --no-startup-id synergy

	/snap/bin/signal-desktop
fi

if [ "$DISPLAY" == "$secondary" ]; then
	echo "It's secondary DISPLAY"
	echo "Kill old xterm"
	pkill xterm
	echo "Open new xterm and create/attach session secondary"
	DISPLAY=:1.1 xterm -fa Consolas -fs 7 -e tmux new-session -A -s secondary &
fi

