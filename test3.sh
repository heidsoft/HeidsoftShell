#!/bin/bash
#测试shell退出状态码
var1=10
var2=30
var3=$[$var1+$var2]
echo the answer is $var3
#exit 5 #自定义退出状态码
exit $var3 #使用参数作为shell退出码


