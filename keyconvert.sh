#Convert private key to public#
#!/bin/bash
cd ~/.ssh;
echo "enter private key filename: "
read key
touch ~/.ssh/$key.pub
ssh-keygen -y -f $key > $key.pub
echo "$key.pub created"
cat ~/.ssh/$key.pub
chmod 400 ~/.ssh/$key.pub
echo "(user@remotehost):"
read login_creds
cat ~/.ssh/$key.pub | ssh $login_creds 'cat >> ~/.ssh/authorized_keys'
ssh -i ~/.ssh/$key $login_creds
