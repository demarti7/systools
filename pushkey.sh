# Throw public key to server#
#!/bin/bash
ls -l /Users/mbc/.ssh/;
echo "Let's first create the directories on the remote server";
echo "username: " ; read username;
echo "($username@remotehostIP) - Enter IP:"; read login_creds;
echo "enter public key filename to push to remote server: "; read key;
echo "mkdir /home/$username/.ssh;cd .ssh;touch authorized_keys" | ssh $username@$login_creds
cat ~/.ssh/$key | ssh $username@$login_creds 'cat >> ~/.ssh/authorized_keys'
