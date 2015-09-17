#############################################################################
#    AWS SSL CERTIFICATE PREP SCRIPT                                        #
#    author: michael.chu@newzulu.com                                        #
#    created:  Thu 10 Sep 2015                                              #
#                                                                           #
#    task: converts .pfx->.txt and .pfx->.crt for easy SSL upload on EC2    #
#    setup: Create an alias in       ~/.bash_profile                        #
#           alias sslaws='/Users/username/.ssh/reference/sslaws.sh'         #
#           source ~/.bash_profile                                          #
#    usage: sslaws <arg>                                                    #
#    examp: sslaws filename.pfx (without the '.pfx', just fileName of .pfx) #
#############################################################################

#!/bin/bash
echo "# executing AWS SSL certificate prep script #"
echo "# Converting .pfx -> .pem #" ;
openssl pkcs12 -in $1.pfx -nocerts -out $1.pem
sleep 1;echo ".";sleep 1;echo ".";sleep 1;echo ".";
echo "---> $1.pem created for further conversion...";
ls -l | grep $1.pem
echo "             ";
echo "# Converting .pem to .txt#"
openssl rsa -in $1.pem -out $1.txt
sleep 1;echo ".";sleep 1;echo ".";sleep 1;echo ".";
echo "---> $1.txt created";
ls -l | grep $1.txt
echo "########################################################"
echo "copy this textblock into Private Key:* textfield on EC2 "
echo "########################################################"
cat $1.txt
echo "              ";
echo "# Converting .pfx to .crt#"
openssl pkcs12 -in $1.pfx -clcerts -nokeys -out $1.crt
sleep 1;echo ".";sleep 1;echo ".";sleep 1;echo ".";
echo "---> $1.crt created";
ls -l | grep $1.crt
echo "########################################################"
echo "copy this textblock into Public Key Certificate:*"
echo "########################################################"
cat $1.crt
echo "  "
echo " TASK COMPLETED "
