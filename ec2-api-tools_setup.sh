# YOU WILL NEED TO SET UP JAVA AND EC2 API TOOLS FOR AWS CLI TOOLS TO WORK 
# - LINUX SETUP

# Install Java
sudo apt-get install unzip;
sudo apt-get install default-jre;
sudo apt-get install default-jdk;
java -version;
which java;
file $(which java)
file /etc/alternatives/java
file /usr/lib/jvm/java-7-openjdk-amd64/jre/bin/java
export JAVA_HOME="/usr/lib/jvm/java-7-openjdk-amd64/jre"

# Install the AWS CLI Using the Bundled Installer
curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip";
unzip awscli-bundle.zip;
sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws;
/usr/local/bin/aws --version;
echo $PATH | grep ~/bin;
export PATH=~/bin:$PATH;

# EC2 API TOOLS
curl -O http://s3.amazonaws.com/ec2-downloads/ec2-api-tools.zip
sudo mkdir /usr/local/ec2
sudo unzip ec2-api-tools.zip -d /usr/local/ec2
cd /usr/local/ec2/ec2-api-tools-1.7.5.1
export EC2_HOME=/usr/local/ec2/ec2-api-tools-1.7.5.1
export PATH=$PATH:$EC2_HOME/bin
export AWS_ACCESS_KEY=AKAKAKAKAKAKKAAK;
export AWS_SECRET_KEY=FZFZFZFZFZFZFZFZFFZFZF;

# AWS CLI COMPLETER http://docs.aws.amazon.com/cli/latest/userguide/cli-command-completion.html
sudo find / -name aws_completer
cd /usr/local/aws/bin/
complete -C '/usr/local/aws/bin/aws_completer' aws
export PATH=/usr/local/aws/bin:$PATH

# CLI53 
# Command line script to administer the Amazon Route 53 DNS service
# https://pypi.python.org/pypi/cli53/0.4.4
#wget https://pypi.python.org/packages/source/c/cli53/cli53-0.4.4.tar.gz
sudo apt-get install python-pip
sudo pip install cli53
echo "run 'cli53 list'"
