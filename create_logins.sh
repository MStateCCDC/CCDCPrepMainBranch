#!/bin/bash

# This script will create the logins from a csv file
# The script does not skip the first line
# https://www.cyberciti.biz/faq/unix-linux-bash-read-comma-separated-cvsfile/
# Preuss 1/18/2020
# Need to modify to create logins
# make input a read from prompt 
# Remember expiration is YYYY-MM-DD, use English Canadian in Excel to get format correct
# Update 1/17/2025

# This image supports the following classes
# CPTR2224,CPTR2245,CSCI1110,nand CSEC1110

clear
echo This script supports the following classes
echo albatross
echo CPTR2224
echo CPTR2245
echo CSCI1110
echo CSEC1110
echo Please remember to build each class login with an individual run of this script.
ls -l *.csv

echo Please enter the csv file name including any file extension.
echo Remember this script will create logins and home directories.
read CVS01

# This will save the old IFS and set separator as comma
OLDIFS=$IFS
IFS=,

# This will check for existence of the csv file
[ ! -f $CVS01 ] && { echo "$CVS01 file not found"; exit 99; }

# This is the loop that does the work.
# List all the fields you want on the read statment
# We add all logins to group "wheel" to allow sudo
while read LNAME FNAME EMAIL LOGIN PASSWD EXPIRE COMMENT CLASS OU DUPLICATE CODE MEXPIRE
do
    echo "Login : $LOGIN"
    groupadd $LOGIN
    useradd -g $LOGIN -G users,wheel,vboxsf -m $LOGIN
    # useradd -g $LOGIN -G users,wheel -m $LOGIN # proxmox version, do not need vboxsf group
    usermod -c "$COMMENT" -e $EXPIRE $LOGIN
    # usermod -aG vboxsf $LOGIN
    echo $LOGIN:"$PASSWD" | chpasswd
    id $LOGIN
    groups $LOGIN
    #echo "Please run secondary password script for albatross logins"

done < $CVS01
IFS=$OLDIFS

# This will delete header creation
userdel -r login

echo "Done"
