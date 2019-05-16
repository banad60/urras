#!/bin/bash

# include bbpro tput-colors
#. ~/.local/bin/tput_init-colors
. tput_init-colors

# get local IP
thisIP=`/sbin/ifconfig | sed -n '2 p' | awk '{print $2}'`

# copy ~/.ssh to root
#printf " ${yellow}-> $thisIP: ${dimyellow}%s${reset}\n" "sudo cp -R /home/$USER/.ssh /root/.ssh"
printf " ${dimyellow}-> $USER@$thisIP: ${dimblue}%s${reset}\n" "sudo cp -R /home/$USER/.ssh /root/.ssh"
sudo cp -v /home/$USER/.ssh/id_rsa.pub /root/.ssh/id_rsa_$USER.pub
#sudo 	cat /home/$USER/.ssh /root


#isAUTHORIZED="sudo su - root -c sed -i.bak 's#`cat ~/.ssh/id_rsa.pub|awk '{print $2}'`##' ~/.ssh/authorized_keys"
#isAUTHORIZED=sudo su - root -c 'grep "`cat ~/.ssh/id_rsa.pub`" /root/.ssh/authorized_keys';
#echo $isAUTHORIZED

printf " ${dimmagenta}?> $USER@$thisIP: ${dimblue}%s${reset}\n" "check if my pubkey is installed for user root"
sudo su - root -c 'grep "`cat ~/.ssh/id_rsa_'$USER'.pub`" /root/.ssh/authorized_keys' >/dev/null 2>&1;

if [ $? -eq 0 ]; then 
    printf " ${dimyellow}-> $USER@$thisIP: ${dimgreen}%s ${dimblue}%s${reset}\n" "OK" "id was installed - do nothing"
else 
    printf " ${dimyellow}-> $USER@$thisIP: ${dimblue}%s${reset}\n" "install pubkey in /root/.ssh/authorized_keys"
    sudo su - root -c 'cat ~/.ssh/id_rsa_'$USER'.pub >> /root/.ssh/authorized_keys'
fi;

sudo rm /root/.ssh/id_rsa_$USER.pub

exit $?

