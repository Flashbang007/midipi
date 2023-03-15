#!/bin/bash

echo "copy midipi.sh"
cp midipi.sh /usr/local/bin/
echo "copy udev rules"
cp 99-midipi.rules /etc/udev/rules.d/
if [ -e /etc/midipi.conf  ]; then
	echo "/etc/midipi.conf allready exists, skipping"
else 
	echo "copy dummy config. Please edit /etc/mdidpi.conf"
	cp mdidpi.conf /etc/
fi
