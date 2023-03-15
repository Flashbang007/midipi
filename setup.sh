#!/bin/bash

if [ "$EUID" -ne 0 ];then 
	echo "Please run with sudo"
	exit
fi

echo "copy midipi.sh"
cp midipi.sh /usr/local/bin/

echo "copy udev rules"
cp 99-midipi.rules /etc/udev/rules.d/
udevadm control --reload
service udev restart

if [ -e /etc/midipi.conf  ]; then
	echo "/etc/midipi.conf allready exists, skipping"
else 
	echo "copy dummy config. Please edit /etc/mdidpi.conf"
	cp mdidpi.conf /etc/
fi

echo "create service file"
cat > /lib/systemd/system/midipi.service << \EOF
[Unit]
Description=MIDI-pi service inital connect MIDI devices

[Service]
Type=oneshot
ExecStart=/usr/local/bin/midipi.sh

[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl enable midipi.service
systemctl start midipi.service
