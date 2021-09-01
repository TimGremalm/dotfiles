#!/bin/bash
for arg in "$@"
do
	# Use dpkg status for checking if package is installed, hide spammy output
	dpkg --status $arg 1>/dev/null 2>&1
	if [ $? -eq 1 ]; then
		# Check if package is available via apt
		apt-cache show $arg 1>/dev/null 2>&1
		if [ $? -eq 0 ]; then
			echo -e "\n$arg is not installed, trying to install it now via apt."
			sudo apt install -y $arg
		else
			# Package not available on apt, try snap instead
			snap info $arg 1>/dev/null 2>&1
			if [ $? -eq 0 ]; then
				# Package is available via snap, check if installed.
				# echo -e "\nPackage $arg available via snap."
				snap info $arg|grep installed 1>/dev/null 2>&1
				if [ $? -eq 1 ]; then
					echo -e "\n$arg is not installed, trying to install it now via snap."
					sudo snap install $arg
				fi
			else
				echo -e "\nPackage $arg not available via snap or apt."
			fi
		fi
	fi
done

