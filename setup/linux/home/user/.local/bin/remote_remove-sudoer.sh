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

SEARCH1=$SUDO_USER"\tALL=(ALL:ALL) NOPASSWD: ALL";
printf " ${yellow}-> ${orange}%s${reset}\n" "sudoer $SUDO_USER - remove '$SEARCH1' in /etc/sudoers"
sed -i '/'"$SEARCH1"'/d' /etc/sudoers

exit $?

