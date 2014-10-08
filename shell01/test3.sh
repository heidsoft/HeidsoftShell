#!/bin/bash
auto_smart_ssh () {
    expect -c "set timeout -1;
                spawn ssh -o StrictHostKeyChecking=no $2 ${@:3};
                expect {
                    *assword:* {send -- $1\r;
                                 expect {
                                    *denied* {exit 2;}
                                    eof
                                 }
                    }
                    eof         {exit 1;}
                }
                "
    return $?
}
 
auto_smart_ssh 1qaz2wsx root@192.168.1.245 touch "myest.txt"
echo -e "\n---Exit Status: $?"
