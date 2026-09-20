#!/bin/bash

# This searches auditd for the Top 6 log reports
#
# Preuss  2/10/2025


#  Authentication and Authorization Reports
sudo cat /var/log/audit/audit.log | grep preuss | grep login

#  Systems and Data Change Reports
sudo cat /var/log/audit/audit.log | grep group

#  Network Activity Reports
sudo cat /var/log/audit/audit.log | grep firewall

#  Resource Access Reports
sudo cat /var/log/audit/audit.log | grep messages

#  Malware Activity Reports
# Install and run ClamAV
# https://en.opensuse.org/ClamAV
sudo zypper install clamav
sudo systemctl start clamav
sudo systemctl enable clamav
sudo clamscan --max-filesize=4000M --max-scansize=4000M --recurisive=yes --infected  --remove /

# Failure and Critical Error Reports
sudo cat /var/log/audit/audit.log | grep shutdown

