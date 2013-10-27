#!/bin/bash
val1=10

if (( $val1**2 >90 ))
then 
	(( val2=$val1**2 ))
	echo "val2=$val2"
fi

