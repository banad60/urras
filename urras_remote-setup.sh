#!/bin/bash
# benutzung: 
#    - localer user, der auf dem server einen priveligierten useraccout hat
#
# local init
./urras_local-setup.sh

#echo ' $PWD '$PWD;
export thisPATH=$PWD
#echo ' $thisPATH '$thisPATH;

# - include color-support
. tput_init-colors;

printf " ${yellow}* ${dimyellow}%s${reset}\n" "\$thisPATH: $thisPATH"

# - include ini-file
. setup/basic_config.ini

# as user
# push ssh-pubkey for first accesss
ssh-export-id $DESTHOST $DESTHOSTUSER
wait

cd $thisPATH

# files upload
printf " ${yellow}* $DESTHOSTUSER: ${dimyellow}%s${reset}\n" "user-upload-1"
##sftp -b $SETUPDIR/.sftp/sftp-upload-1.bat $DESTHOSTUSER@$DESTHOST
sftp -b $thisPATH/setup/.sftp/sftp-upload-1.bat $DESTHOSTUSER@$DESTHOST
wait

cd $HOME

## add paswordless login-privilegs for $USER in /etc/sudoers
printf " ${yellow}* $DESTHOSTUSER: ${dimyellow}%s${reset}\n" "add paswordless login-privilegs for $USER in /etc/sudoers"
ssh -A $DESTHOSTUSER@$DESTHOST -t '~/.local/bin/remote_add-sudoer.sh'
wait


## copy ~/.ssh/authorized_key to root
printf " ${yellow}* $DESTHOSTUSER: ${dimyellow}%s${reset}\n" "merge pubkey to $DESTHOSTUSER@$DESTHOST/.ssh/authorized_key"
ssh -A $DESTHOSTUSER@$DESTHOST -t '~/.local/bin/remote_cp-id_root.sh'
wait

# as root:
## first do a update as root an get mc
printf " ${red}* as root: ${blutorange}%s${reset}\n" "apt-get -y update;"
ssh -A root@$DESTHOST -t 'apt-get -y update; apt-get -y install gpm mc mc-data;';
wait


## set timezone
#off printf " ${red}* as root: ${blutorange}%s${reset}\n" "set-timezone Europe/Berlin, set-ntp on, adjust-system-clock"
#off ssh -A root@$DESTHOST -t 'timedatectl set-timezone Europe/Berlin; timedatectl set-ntp on; timedatectl --adjust-system-clock';
#off wait


#copy  .bashrc .profile # color-support 4 root-console
cd $thisPATH
printf " ${red}* as root: ${blutorange}%s${reset}\n" "root-upload-1"
#sudo su - root -c 'cd ~; 
sftp -b $thisPATH/setup/.sftp/sftp-upload-root-1.bat root@$DESTHOST;
wait


# switch off welcome-messages
#printf " ${yellow}* $DESTHOSTUSER: ${dimyellow}%s${reset}\n" "switch off welcome-messages"
printf " ${red}* as root: ${blutorange}%s${reset}\n" "chmod -x /etc/update-motd.d/*"
ssh -A root@$DESTHOST "chmod -x /etc/update-motd.d/*"


## set hostname
printf " ${red}* as root: ${blutorange}%s${reset}\n" "set-hostname to $DESTHOSTNAME"
ssh -A root@$DESTHOST -t 'hostnamectl set-hostname '$DESTHOSTNAME';';
wait


printf " ${red}* as root: ${blutorange}%s${reset}\n" "install some apps"
ssh -A $DESTHOSTUSER@$DESTHOST  -t '~/.local/bin/remote_basic_apps install'
wait


printf " ${red}* as root: ${blutorange}%s${reset}\n" "apt-get -y upgrade;"
ssh -A root@$DESTHOST -t 'apt-get -y upgrade;';
wait


# go back
cd $thisPATH;

printf " ${green}done ${dimyellow}%s${reset}\n" "now you have root access:"
printf "   ${green}-> ${orange}%s${reset}\n" "ssh -A $DESTHOSTUSER@$DESTHOST"
printf "   ${green}-> ${orange}%s${reset}\n" "ssh -A root@$DESTHOST"
exit 0
