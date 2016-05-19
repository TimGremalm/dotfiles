#!/bin/bash
diffviewer="vimdiff "

#Make sure our environment is set
if [[ -z ${HOME+x} ]]; then
	echo "Can't determine the home path, Varible HOME is not set."
	exit 1
fi

if ! [[ -d "${HOME}/" ]]; then
	echo "Can't determine the home path, Varible HOME is not a directory."
	exit 2
fi

#Check arguments
action="help"
for i in "$@"
do
case $i in
	diff)
	action="diff"
	shift # past argument=value
	;;
	help)
	action="help"
	shift # past argument=value
	;;
	merge)
	action="merge"
	shift # past argument=value
	;;
	status)
	action="status"
	shift # past argument=value
	;;
	-l=*|--lib=*)
	LIBPATH="${i#*=}"
	shift # past argument=value
	;;
	*)
		# unknown option
	;;
esac
done

#Show header
case $action in
diff)
	echo "Diff repo files with home directory, show the difference."
	echo " "
	;;
help)
	echo "sync_with_homedir.sh"
	echo "===================="
	echo "Used for copying config files from this repo to the home directory."
	echo "Written by Tim Gremalm 2016-05-19 (tim@gremalm.se http://tim.gremalm.se)"
	echo "Arguments:"
	echo "  diff   - Diff repo files with home directory, show the difference."
	echo "  help   - Show this message."
	echo "  merge  - Syncing repo files with home directory. If files differ vim diff will open."
	echo "  status - Diff repo files with home directory, show the filenames of changed files."
	echo " "
	;;
merge)
	echo "Syncing repo files with home directory."
	echo "If files differ vim diff will open."
	echo " "
	;;
status)
	echo "Diff repo files with home directory, show the filenames of changed files."
	echo " "
	;;
esac

#The function for comparing files and copy vimdiff them
function CopyOrDiff {
	#Make sure the file is in the git-repo
	file=$1
	action=$2
	git ls-files "$file" --error-unmatch 1>/dev/null 2>&1
	if [[ $? != 0 ]]; then
		return 1
	fi
	if [[ "$file" == "./sync_with_homedir.sh" ]]; then
		echo 2
		#return 2
	fi
	echo "$1"
}
export -f CopyOrDiff

#Perform the action
case $action in
diff)
	find . -type f -not -path "./.git/*" -exec bash -c 'CopyOrDiff "$0" diff' {} \;
	;;
merge)
	find . -type f -not -path "./.git/*" -exec bash -c 'CopyOrDiff "$0" merge' {} \;
	;;
status)
	find . -type f -not -path "./.git/*" -exec bash -c 'CopyOrDiff "$0" status' {} \;
	;;
esac

echo "EoF"

