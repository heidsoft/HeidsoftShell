#打印匹配includ字符串的行号
[root@cloud src]# sed -n '/include/=' heidsoft_error.c 

#匹配元字符.
[root@cloud src]# sed -n '/\./p' heidsoft_error.c

#匹配元字符$
[root@cloud src]# sed -n '/\$/p' heidsoft_error.c

#使用元字符匹配（$表示行尾，但在sed中表示最后一行）
[root@cloud src]# sed -n '$p' heidsoft_error.c 

#打印从匹配到void的这行到最后一行
[root@cloud src]# sed -n '/void/,$p' 
