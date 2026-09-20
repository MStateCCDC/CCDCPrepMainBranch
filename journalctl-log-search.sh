#!/bin/bash

# This searches journalctl for the Top 6 log reports
#
# Preuss  2/10/2025


#  Authentication and Authorization Reports
sudo journalctl -xe | grep preuss | grep login

#  Systems and Data Change Reports
sudo journalctl -xe | grep group

#  Network Activity Reports
sudo journalctl -xe | grep eth0

#  Resource Access Reports
sudo journalctl -xe | grep /var/log/messages

#  Malware Activity Reports
# Install and run ClamAV
# https://en.opensuse.org/ClamAV
sudo zypper install clamav
sudo systemctl start clamav
sudo systemctl enable clamav
sudo clamscan --max-filesize=4000M --max-scansize=4000M --recurisive=yes --infected  --remove /

# Failure and Critical Error Reports
sudo journalctl -xe | grep down

