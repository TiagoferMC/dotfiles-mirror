#!/bin/bash

if [ $# -eq 1 ]; then
    doas setsid -f rc-service mullvad-daemon $1
else
    doas setsid -f rc-service mullvad-daemon
fi

