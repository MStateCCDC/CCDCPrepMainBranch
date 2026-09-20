#!/bin/bash

# This searches /var/log/messages for the Top 6 log reports
# This script needs debugging
#
# Preuss  2/10/2025

# Start script output
# script ~/message-log-01.txt

# Authentication and Authorization Reports
echo "This finds all instance of login and preuss in /var/log/messages"
sudo cat /var/log/messages | grep preuss | grep login

# Systems and Data Change Reports
echo "This finds all instance of /etc/group written"
sudo cat /var/log/messages | grep /etc/group | grep written

# Network Activity Reports
echo "This reports eth0 Down"
sudo cat /var/log/messages | grep eth0 | grep Down

# Resource Access Reports
echo "This report preuss access to /var/log/messages"
sudo cat /var/log/messages | grep /var/log/messages | grep preuss

# Malware Activity Reports
# Install and run ClamAV
# https://en.opensuse.org/ClamAV
sudo zypper install clamav
sudo systemctl start freshclam
sudo systemctl enable freshclam.timer
sudo systemctl start clamd
sudo systemctl enable clamd
echo "Starting scan of home directory"
#T sudo clamscan --max-filesize=4000M --max-scansize=4000M --recursive=yes --infected  --remove /
sudo clamscan --max-filesize=4000M --max-scansize=4000M --recursive=yes --infected  --remove .
#T sudo clamscan --recursive=yes --infected /

# Failure and Critical Error Reports
sudo cat /var/log/messages | grep stop
# or
sudo cat /var/log/messages | grep down


