# gitslap.sh - slap it up & git it done 
ls -l 
echo "Make sure you are in the directory before repo folder";echo "submit filename:";read filename;
gitfile=$(echo $filename)
cp ./$gitfile /Users/mbc/[mysystem]/myscripts/admintools/systools
cd /Users/mbc/[mysystem]/myscripts/admintools/systools  
git add $gitfile
echo "add comment:";read comment;
git commit -m '$comment'
git push origin master
