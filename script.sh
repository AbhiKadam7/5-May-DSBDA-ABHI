#!/bin/bash

echo "Hello, $USER"

sudo -v

log() {
    journalctl -r --since"10 min ago" > ~/test.txt 
}

cd ~/

check_usb() {
grep -qF "Attached SCSI removable disk" test.txt
if [[ $? -eq 0 ]]; 
    then
        echo "found"
        journalctl --rotate && journalctl --vacuum-time=15 min
    else
        journalctl -r --since "5 min ago"
fi
}

log
check_usb










