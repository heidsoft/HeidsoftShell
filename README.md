Shell学习记录

----------
#系统命令
##cpio命令
利用cpio 可将文件或目录从文件库获取出来或将散列文件拷贝到文件库。cpio 的指令格式： 
        cpio –i[bcdmrtuv] [patterns] 
        cpio –o [abcv] 
        cpio –p [adlmuv][directory] 

说明：cpio 共有三种基本模式，-o即copy-out 模式，将一组文件copy到一个文件库，-i 即copy-in 模式，读取文件库，并将其展开在当前目录。-p 能从某个目录读取所有文件（包括子目录到另一个目录），且不以archive(归档)的方式存放。 
    cpio 常配合shell使用。-o常用标准输入设备读取要copy 的文件名称，并将copy成的archive file 通过标准输出设备输出。一般利用输入/输出重定向或管道的原理，达到真正复制的功能。 

（一）利用cpio备份： 
[例1] 
        $ find temo –print | cpio –ocdv > /dev/rfd0135ds18 
例: find . |cpio -co > ../initrd

将temp目录下的文件备份到软盘上。-o表示输出模式，-c生成一个带有头信息的文件。 -d表示按需要生成目录，-v表示命令执行时不断显示信息。用“>”把结果定向到软盘。 
[例2] 
        $ ls |cpio –o >/usr/backup
将当前目录下的所有文件复制成backup archive file 
[例3] 
        $ ls *.c | cpio –o>backup
复制工作目录中的所有的c程序. 
[例4] 
        $ ls| cpio –p /usr/linfs/tempdir 
复制当前工作目录下的文件到/usr/linfs/tempdir 目录，不生成archive  file 

（二）利用cpio 复原： 
[例5] 
        $ cpio –icdv < /dev/rfd0135ds18 
例： cpio -i < ../initrd将上层目录的initrd文件释放到当前文件夹

将软盘中的文件复原。-i告诉cpio把文件作为它的输入，-d按需要生成目录，-v显示执行时的所有信息，-c具有头文件格式。 
[例6] 
        $ cpio –icdv "*stat.wp" < /dev/rfd0135ds18 
仅复原*stat.wp的文件 
[例7] 
        $ cpio –i </usr/linfs/old1 *.f 
仅复原*.f 文件

序：
(gzip 压缩文件)
gzip 压缩文件对应的解压缩文件为gunzip。压缩后的文件名称为“.gz”。命令格式： 
        gzip  filename 
        gunzip  filename 
#软件编程