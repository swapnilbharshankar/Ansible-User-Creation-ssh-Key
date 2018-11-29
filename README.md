# Ansible-User-Creation-ssh-Key


1)

Add list of users in "user_list.txt" in below format.

Vender1|user1
Vender1|user2
Vender2|user3
Vender2|user4
Vender3|user5
Vender3|user6

Note:- Please remove the space space at the end of line if any.

-----------

2)

Create User pem, ppk, pub key

Run below shell script

sh key_creation.sh

it will create the keys

root@ip-10-10-3-202:/home/ubuntu/Ansible-User-Creation-ssh-Key# ls -lrth roles/users/files/
total 24K
drwxr-xr-x 2 root root 4.0K Nov 29 07:15 user1
drwxr-xr-x 2 root root 4.0K Nov 29 07:15 user2
drwxr-xr-x 2 root root 4.0K Nov 29 07:16 user3
drwxr-xr-x 2 root root 4.0K Nov 29 07:16 user4
drwxr-xr-x 2 root root 4.0K Nov 29 07:16 user5
drwxr-xr-x 2 root root 4.0K Nov 29 07:16 user6
root@ip-10-10-3-202:/home/ubuntu/Ansible-User-Creation-ssh-Key# ls -lrth roles/users/files/user1/
total 12K
-rw-r--r-- 1 root root  731 Nov 29 07:15 user1.pub
-rw------- 1 root root 3.2K Nov 29 07:15 user1.pem
-rw------- 1 root root 2.6K Nov 29 07:15 user1.ppk
root@ip-10-10-3-202:/home/ubuntu/Ansible-User-Creation-ssh-Key#


3)

Create a yml variable file

sh add_user_var.sh

It will add the usernames in yml variable file.

root@ip-10-10-3-202:/home/ubuntu/Ansible-User-Creation-ssh-Key# cat roles/users/vars/main.yml
---
users:
  - username: user1
  - username: user2
  - username: user3
  - username: user4
  - username: user5
  - username: user6
root@ip-10-10-3-202:/home/ubuntu/Ansible-User-Creation-ssh-Key#

4) To Create users on Destination server 

ansible-playbook -i /etc/ansible/hosts -b playbook.yml -t create

5) To add keys to users home directory

ansible-playbook -i /etc/ansible/hosts -b playbook.yml -t upload

6) To add users inside the sudoers file

ansible-playbook -i /etc/ansible/hosts -b playbook.yml -t sudo_add


Directory Structure

```
.
├── add_user_var.sh
├── key_creation.sh
├── playbook.retry
├── playbook.yml
├── README.md
├── roles
│   └── users
│       ├── files
│       │   ├── user1
│       │   │   ├── user1.pem
│       │   │   ├── user1.ppk
│       │   │   └── user1.pub
│       │   ├── user2
│       │   │   ├── user2.pem
│       │   │   ├── user2.ppk
│       │   │   └── user2.pub
│       │   ├── user3
│       │   │   ├── user3.pem
│       │   │   ├── user3.ppk
│       │   │   └── user3.pub
│       │   ├── user4
│       │   │   ├── user4.pem
│       │   │   ├── user4.ppk
│       │   │   └── user4.pub
│       │   ├── user5
│       │   │   ├── user5.pem
│       │   │   ├── user5.ppk
│       │   │   └── user5.pub
│       │   └── user6
│       │       ├── user6.pem
│       │       ├── user6.ppk
│       │       └── user6.pub
│       ├── tasks
│       │   ├── main.yml
│       │   ├── sudoers.yml
│       │   ├── upload_keys.yml
│       │   └── usercreation.yml
│       └── vars
│           └── main.yml
└── user_list.txt

```
