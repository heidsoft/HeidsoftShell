#!/bin/bash
testuser=heidsoft

if grep $testuser /etc/passwd
then
	echo the bash files for user $testuser are:
	ls -a /home/$testuser/.b*
fi

