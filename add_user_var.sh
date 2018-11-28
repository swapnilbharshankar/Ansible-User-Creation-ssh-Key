> /home/ubuntu/Ansible-User-Creation-ssh-Key/roles/users/vars/main.yml
echo "---" >> /home/ubuntu/Ansible-User-Creation-ssh-Key/roles/users/vars/main.yml
echo "users:" >> /home/ubuntu/Ansible-User-Creation-ssh-Key/roles/users/vars/main.yml

file=/home/ubuntu/Ansible-User-Creation-ssh-Key/user_list.txt
IFS="|"

while read f1 f2 f3
do

        echo "  - username: $f2" >> /home/ubuntu/Ansible-User-Creation-ssh-Key/roles/users/vars/main.yml

done < $file

