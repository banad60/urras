#!/bin/bash
# benutzung: 
#    - localer user, der auf dem server einen priveligierten useraccout hat
#
# store path
export thisPATH=$PWD

# - include color-library
. tput_init-colors;

printf " ${yellow}* ${dimyellow}%s${reset}\n" "\$thisPATH: $thisPATH"

# - include ini-file
. setup/basic_config.ini


printf " ${red}* as root: ${blutorange}%s${reset}\n" "purge all installed apps"
ssh -A $DESTHOSTUSER@$DESTHOST  -t '~/.local/bin/remote_basic_apps remove'
wait


cd $HOME
printf " ${yellow}* ${dimyellow}%s${reset}\n" "remove sudoer $DESTHOSTUSER"
ssh -A $DESTHOSTUSER@$DESTHOST -t '~/.local/bin/remote_remove-sudoer.sh'

printf " ${yellow}* ${dimyellow}%s${reset}\n" "delete files of desitnationuser"
cd ~/.local/bin
sftp -b $thisPATH/setup/.sftp/sftp-remove-all.bat $DESTHOSTUSER@$DESTHOST
wait

# remove ssh-pubkey from user
$thisPATH/usr/bin/ssh-remove-id $DESTHOST
wait


# remove /opt/urras
printf " ${yellow}* ${dimyellow}%s${reset}\n" "delete files /opt/urras/*"
ssh -A root@$DESTHOST -o PasswordAuthentication=no 'rm -Rv /opt/urras'


# as user: remote remove via sftp 
printf " ${yellow}* ${dimyellow}%s${reset}\n" "delete files of root"
sftp -b $thisPATH/setup/.sftp/sftp-remove-root-all.bat root@$DESTHOST
wait


# as user: remote remove ssh-pubkey of root 
$thisPATH/usr/bin/ssh-remove-id $DESTHOST root


if [ $? ]; then
		printf " ${green}done ${dimyellow}%s${reset}\n" ":-)"
else
		printf " ${red}failed ${dimyellow}%s${reset}\n" ":-("
fi


# go back
cd $thisPATH;


exit


