# Converting private key into a public key #
#!/bin/bash
ssh-keygen -y -f $1.pem > $1.pub
echo "generating public key ..." 
echo "$1.pub created"; 
ls -l | grep $1.pub
echo "---------------------------------------------------"
cat $1.pub;
