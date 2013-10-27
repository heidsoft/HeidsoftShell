#!/bin/bash
testing=`date`
echo $testing

today=`date +%y%m%d`
ls /usr/bin -al > log.$today
