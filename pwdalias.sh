#alias pa='sh /Users/mbc/[mysystem]/myscripts/admintools/pwdalias.sh'#
#!/bin/bash
echo "# generating new alias from current pwd #"
echo "Create alias: ";read newAlias
var=$(echo $newAlias) 
rm /Users/mbc/\[mysystem\]/myscripts/admintools/pwdalias_mark1;touch /Users/mbc/\[mysystem\]/myscripts/admintools/pwdalias_mark1
start=$(echo "alias $var=")
alias=$(pwd);
#echo "insert <command> before $alias : ";read command
#append=$(echo $command)
echo "$start'cd $alias; ls -l'" >> /Users/mbc/\[mysystem\]/myscripts/admintools/pwdalias_mark1
echo "break"
#echo " $start'$append $alias; ls -l;'" >> /Users/mbc/\[mysystem\]/myscripts/admintools/pwdalias_mark1
genalias=$(cat /Users/mbc/\[mysystem\]/myscripts/admintools/pwdalias_mark1)
echo $genalias >> ~/.bash_profile
echo "now execute: source ~/.bash_profile"
clear
echo $genalias "has been made"
