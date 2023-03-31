# MIDIpi

This project helps to connect USB MIDI devices via a RaspberryPi (or any Linux computer with `aconnect` ) to each other.


## Installation

Copy project from git :
```bash
git clone [REPO URL]
```
Change dir into project dir:
```bash
cd midipi
```
Install app:
```bash
sudo ./setup.sh
```

## Configuration

Find your plugged MIDI devices with:
```bash
aconnect -l
```
giving you the output:
```
client 0: 'System' [type=Kernel]
    0 'Timer           '
    1 'Announce        '
client 14: 'Midi Through' [type=Kernel]
    0 'Midi Through Port-0'
client 28: 'OP-Z' [type=Kernel,card=3]
    0 'OP-Z MIDI 1     '
client 32: 'OP-1' [type=Kernel,card=4]
    0 'OP-1 MIDI 1     
```
If you want to connect `OP-Z` to `OP-1`, just edit `/etc/midipi.conf` like this:
```
OP-Z=OP-1
```
You need to apply the config by either unplug and plug an USB deve again or `systemctl restart midipi.service`.

## Advices
- Unplugging and plugging devices triggers the script in case something is not working.

## References
Thank you for giving me the inspiration:
- https://ejlabs.net/raspberry-pi-as-usb-midi-host/
- https://github.com/ecutsa/Raspberry-USB-MIDI-Host
