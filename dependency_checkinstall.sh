#!/bin/bash
for arg in "$@"
do
	# Use dpkg status for checking if package is installed, hide spammy output
	dpkg --status $arg 1>/dev/null 2>&1
	if [ $? -eq 1 ]; then
		echo "$arg is not installed, trying to install it now"
		sudo apt install $arg
	fi
done

