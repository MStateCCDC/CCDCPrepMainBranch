#!/bin/bash

# This script will delete the logins from a csv file
# The script does not skip the first line
# https://www.cyberciti.biz/faq/unix-linux-bash-read-comma-separated-cvsfile/
# Preuss 1/10/2019
# Need to modify to create logins
# make input a read from prompt 


echo Please enter the csv file name including any file extension.
echo Remember this script will delete logins and home directories.
read CVS01

# This will save the old IFS and set separator as comma
OLDIFS=$IFS
IFS=,

# This will check for existence of the csv file
[ ! -f $CVS01 ] && { echo "$CVS01 file not found"; exit 99; }

# This is the loop that does the work.
# List all the fields you want on the read statment
while read LNAME FNAME EMAIL LOGIN PASSWD EXPIRE COMMENT CLASS OU DUPLICATE CODE MEXPIRE
do

	echo "Login : $LOGIN"
	# This will delete the login and home directory
	userdel -r $LOGIN
	# This will delete the primary group for each login
	groupdel $LOGIN

done < $CVS01
IFS=$OLDIFS
