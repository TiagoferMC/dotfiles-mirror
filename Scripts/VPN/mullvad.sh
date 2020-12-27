#!/bin/bash

if [ $# -eq 1 ]; then
    sudo rc-service mullvad-daemon $1
else
    sudo rc-service mullvad-daemon
fi

