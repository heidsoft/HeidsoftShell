#!/bin/bash
#通过内置bc计算器进行数据运算
#作者:黑洞
#Time:2013/10/22

var1=`echo " scale=4;var1=10;var2=30; var2/var1" | bc`
echo the answer is $var1
