#!/bin/bash

layout=$(setxkbmap -print -verbose 10 | awk -F\: '/layout/ {gsub (" ", "", $0); print $2}')

if [ "$layout" == "us" ]; then
    $(setxkbmap ucteng)
else
    $(setxkbmap us)
fi

