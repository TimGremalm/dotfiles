#!/bin/bash
if [ $# == 3 ];
then
	argPaneID=$1
	argWidth=$2
	argHeight=$3
	#echo "haj3 $argPaneID $argWidth $argHeight"
	if [ $argPaneID == "active" ];
	then
		result=`tmux list-panes | grep active`
		paneID=`echo $result|cut -c -1`
	else
		result=`tmux list-panes|grep "$argPaneID:"`
		paneID=`echo $argPaneID`
	fi
	if [ -z "$result" ];
	then
		echo "There's no pane with id $argPaneID"
		exit 1
	else
		#echo $result
		result2=`echo $result|awk '{print $2}'`
		#echo $result2

		# don't default to printing each line (-n)
		#exclude [
		#include group of anything
		#exclude an x and the rest
		#print the substitution (p)
		paneWidth=`echo $result2|sed -rn 's/\[(.*)x.*/\1/p'`
		#echo $paneWidth
		paneHeight=`echo $result2|sed -rn 's/.*x(.*)\]/\1/p'`
		#echo $paneHeight

		#paneWidth=""
		#paneHeight=""
		if [[ -z "$paneWidth" || -z "$paneHeight" ]];
		then
			echo "paneWidth ($paneWidth) or paneHeight ($paneHeight) can't be set from result($result)"
		else
			echo "IsSet paneWidth ($paneWidth) paneHeight ($paneHeight)"
			paneDiffWidth=$(expr  $argWidth - $paneWidth)
			paneDiffHeight=$(expr $argHeight - $paneHeight)
			echo "paneDiffWidth ($paneDiffWidth) paneDiffHeight ($paneDiffHeight)"
			if [ $paneDiffWidth -lt 0 ];
			then
				echo "DiffWidth minus is $paneDiffWidth"
				paneDiffWidth=`echo $paneDiffWidth|cut -c 2-`
				tmux resize-pane -L -t $paneID $paneDiffWidth
			else
				echo "DiffWidth plus is $paneDiffWidth"
				tmux resize-pane -R -t $paneID $paneDiffWidth
			fi
			if [ $paneDiffHeight -lt 0 ];
			then
				echo "DiffHeight minus is $paneDiffHeight"
				paneDiffHeight=`echo $paneDiffHeight|cut -c 2-`
				tmux resize-pane -U -t $paneID $paneDiffHeight
			else
				echo "DiffHeight plus is $paneDiffHeight"
				tmux resize-pane -D -t $paneID $paneDiffHeight
			fi
		fi
	fi
else
	if [ $# == 1 ];
	then
		if [ $1 == "list" ];
		then
			tmux list-panes
		else
			if [ $1 == "show" ];
			then
				tmux display-panes
			else
				echo "pane sets the size of a pane in tmux."
				echo "pane [active|#id] [width] [height]"
				echo "or pane list"
				echo "or pane show"
			fi
		fi
	else
		echo "pane sets the size of a pane in tmux."
		echo "pane [active|#id] [width] [height]"
		echo "or pane list"
		echo "or pane show"
	fi
fi
