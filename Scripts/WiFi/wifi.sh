#!/bin/bash

# WPA_SUPPLICANT
sudo wpa_supplicant -c /etc/wpa_supplicant/wpa_supplicant.conf -i wlan0 -B
sudo wpa_supplicant -c /etc/wpa_supplicant/wpa_supplicant.conf -i wlan1 -B

# DHCLIENT
sudo dhclient

