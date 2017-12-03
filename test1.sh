#!/bin/bash
#通过内置bc计算器进行数据运算
#作者:黑洞
#Time:2013/10/22

read -p " shell script 计算测试" name

echo -e "$name \n如下是计算测试"


var1=`echo " scale=4;var1=10;var2=30; var2/var1" | bc`
echo the answer is $var1


declare -r NUM1=5

num2=4

num3=$(( NUM1 + num2))
num4=$(( NUM1 - num2))
num5=$(( NUM1 * num2))
num6=$(( NUM1 / num2))

echo "5+4=$num3"
echo "5-4=$num4"
echo "5*4=$num5"
echo "5/4=$num6"

echo $((5**2))
echo $((5%4))

rand=5
let rand+=4
echo $rand

echo "rand++ = $(( rand++ ))"
echo "++rand = $(( ++rand ))"

