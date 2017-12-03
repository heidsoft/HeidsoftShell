#!/bin/bash
testuser=badtest

if grep $testuser /etc/passwd
then
	echo the bash files for user $testuser are:
	ls -a /home/$testuser/.b*
else 
	echo "the user name $testuser does not exist on this system"
fi

