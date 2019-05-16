#!/bin/bash

#. ~/.local/bin/tput_init-colors
. tput_init-colors


rootcheck () {
    if [ $(id -u) != "0" ]
    then
        sudo "$0" "$@"
        exit $?
    fi
}
rootcheck "${@}";

printf " ${yellow}: ${orange}%s${reset}\n" "user: $USER  sudoer: $SUDO_USER"
grepRESULT=`grep -e $SUDO_USER".*NOPASSWD*" /etc/sudoers`
isSUDOER=$?


#echo $isSUDOER
#if [ $isSUDOER -eq 1 ] ; then 
if [ $isSUDOER -eq 1 ] ; then 

      SEARCH="%sudo\tALL=(ALL:ALL) ALL";
      ADDUSR1=$SUDO_USER"\tALL=(ALL:ALL) NOPASSWD: ALL";
      printf " ${yellow}-> ${orange}%s${reset}\n" "sudoer $SUDO_USER do not exists - add $ADDUSR1 to /etc/sudoers"
      #sed -i 's/'"$SEARCH"'/'"$SEARCH\n$ADDUSR1"'/g' /etc/sudoers     # replace
      sed -i '/'"$SEARCH"'/a '"$ADDUSR1" /etc/sudoers                  # insert
else
      printf " ${red}!> ${orange}%s${reset}\n" "user exists -do nothing ${grey}(status $isSUDOER)/[ $grepRESULT ]"
fi;

exit $?
