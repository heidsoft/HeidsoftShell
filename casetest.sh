#!/bin/bash
var1=$1
case $var1 in
rich | barbara)
	echo "Welcome,$var1"
	echo "Thanks access ";;
testting)
	echo "Special testing account";;
heidsoft)
    echo "is me";;
*) 
	echo "other ";;
esac
