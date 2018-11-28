#!/bin/bash

sudo apt-get install putty-tools


DEST="/home/ubuntu/Ansible-User-Creation-ssh-Key/roles/users/files"
file=/home/ubuntu/Ansible-User-Creation-ssh-Key/user_list.txt


IFS="|"

while read f1 f2 f3
do

        mkdir $DEST/$f2
        if [ -f "$DEST/$f2/$f2.pem" ]
        then
                echo "user key is present"
        else
                echo -e "\n\n\n" | ssh-keygen -t rsa -b 4096 -N "" -C "$f2" -f $DEST/$f2/$f2
                mv $DEST/$f2/$f2 $DEST/$f2/$f2.pem
                puttygen $DEST/$f2/$f2.pem -O private -o $DEST/$f2/$f2.ppk
        fi
done < $file

