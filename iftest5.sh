#!/bin/bash
#数值比较
val1=10
val2=11

if [ $val1 -gt 5 ]
then 
	echo "val1 大于 5"
fi

if [ $val1 -eq $val2 ]
then
	echo "val1 等于val2"
else
	echo "val1 不等于val2"
fi


