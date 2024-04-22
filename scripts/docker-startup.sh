#!/bin/bash
eval $(dbus-launch --sh-syntax)
eval $(echo '' | /usr/bin/gnome-keyring-daemon --unlock)
node ./bin/station.js
