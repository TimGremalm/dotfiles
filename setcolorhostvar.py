#!/usr/bin/env python3
import sys
from os.path import exists, expanduser
import socket
import hashlib
import getpass

profile = expanduser("~/.profile")
bashrc = expanduser("~/.bashrc")
hostname = socket.gethostname()
username = getpass.getuser()

# Nice colors picked by HSL values from https://jonasjacek.github.io/colors/
hostcolors = [
	(52, "DarkRed", 124, "Red3"),
	(22, "DarkGreen", 155, "DarkOliveGreen2"),
	(26, "DodgerBlue3", 69, "CornflowerBlue"),
	(37, "LightSeaGreen", 50, "Cyan2"),
	(56, "Purple3", 135, "MediumPurple2"),
	(178, "Gold3", 227, "LightGoldenrod1"),
	(31, "DeepSkyBlue3", 117, "SkyBlue1"),
	(143, "DarkKhaki", 228, "Khaki1"),
	(166, "DarkOrange3", 215, "SandyBrown"),
]

def termColorBasedOnTextHash(input: str, colorlist: list):
	inthash = int(hashlib.sha1(input.encode("utf-8")).hexdigest(), 16) % (10 ** 8)
	colorindex = inthash % len(colorlist)
	# print(f"input {input} inthash {inthash} colorindex {colorindex}")
	return colorlist[colorindex]
	# return colorlist[0]

def searchStringInFile(filename, stringtosearch):
	# Search for the given string in file and return lines containing that string, along with line numbers.
	linenumber = 0
	listofresults = []
	if not exists(filename):
		return []
	with open(filename, 'r') as read_obj:
		for line in read_obj:
			linenumber += 1
			if stringtosearch in line:
				listofresults.append((linenumber, line.rstrip()))
	# Return list of tuples containing line numbers and lines where string is found
	return listofresults

def appendToFile(filename, stringtoappend):
	with open(filename, "a") as f:
		f.write(stringtoappend)

# Host colors
if searchStringInFile(profile, "HostBG"):
	print("HostBG exist in ~/.profile.")
else:
	print("HostBG doesn't exist in ~/.profile.")
	termcolor = termColorBasedOnTextHash(hostname, hostcolors)
	vardecl = f"\n# writtten by setcolorhostvar.py\nexport HostBG='\[\e[48;5;{termcolor[0]}m\]'"
	appendToFile(profile, vardecl)
if searchStringInFile(profile, "HostFG"):
	print("HostFG exist in ~/.profile.")
else:
	print("HostFG doesn't exist in ~/.profile.")
	termcolor = termColorBasedOnTextHash(hostname, hostcolors)
	vardecl = f"\n# writtten by setcolorhostvar.py\nexport HostFG='\[\e[38;5;{termcolor[0]}m\]'"
	appendToFile(profile, vardecl)
if searchStringInFile(profile, "HostTX"):
	print("HostTX exist in ~/.profile.")
else:
	print("HostTX doesn't exist in ~/.profile.")
	termcolor = termColorBasedOnTextHash(hostname, hostcolors)
	vardecl = f"\n# writtten by setcolorhostvar.py\nexport HostTX='\[\e[38;5;{termcolor[2]}m\]'"
	appendToFile(profile, vardecl)

# User colors
if searchStringInFile(profile, "UserBG"):
	print("UserBG exist in ~/.profile.")
else:
	print("UserBG doesn't exist in ~/.profile.")
	termcolor = termColorBasedOnTextHash(username, hostcolors)
	vardecl = f"\n# writtten by setcolorhostvar.py\nexport UserBG='\[\e[48;5;{termcolor[0]}m\]'"
	appendToFile(profile, vardecl)
if searchStringInFile(profile, "UserFG"):
	print("UserFG exist in ~/.profile.")
else:
	print("UserFG doesn't exist in ~/.profile.")
	termcolor = termColorBasedOnTextHash(username, hostcolors)
	vardecl = f"\n# writtten by setcolorhostvar.py\nexport UserFG='\[\e[38;5;{termcolor[0]}m\]'"
	appendToFile(profile, vardecl)
if searchStringInFile(profile, "UserTX"):
	print("UserTX exist in ~/.profile.")
else:
	print("UserTX doesn't exist in ~/.profile.")
	termcolor = termColorBasedOnTextHash(username, hostcolors)
	vardecl = f"\n# writtten by setcolorhostvar.py\nexport UserTX='\[\e[38;5;{termcolor[2]}m\]'"
	appendToFile(profile, vardecl)

# Include custom bashrc in .bashrc
if searchStringInFile(bashrc, ".config/bash/bashrc"):
	print(".config/bash/bashrc exists in ~/.bashrc.")
else:
	print(".config/bash/bashrc doesn't exist in ~/.bashrc.")
	vardecl = f"\n# writtten by setcolorhostvar.py\nif [ -f $HOME/.config/bash/bashrc ]; then\n\t. ~/.config/bash/bashrc\nfi"
	appendToFile(bashrc, vardecl)

