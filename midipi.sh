#!/bin/bash

CONFIG=/etc/midipi.conf

echoerr() { echo "$@" 1>&2; }

mapall(){
	while read line; do
		# ignore comments
		if [[ $line = \#* ]]; then
			continue
		fi
		
		# collect date
		a=$(echo $line | cut -d'=' -f1) 
		b=$(echo $line | cut -d'=' -f2) 
		aID=$(aconnect -l | grep -i -E "${a}.*card" | cut -d' ' -f2 | sed 's/[^0-9]*//g')
		bID=$(aconnect -l | grep -i -E "${b}.*card" | cut -d' ' -f2 | sed 's/[^0-9]*//g')
	
		# connect devices
		aconnect $aID:0 $bID:0
		if [ $? -ne 0 ]; then
			echoerr "Map $a => $b did not work";
			continue
		fi
	
	done < $CONFIG
}

mapall
