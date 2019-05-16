#!/bin/bash

#echo ' $PWD '$PWD;

export thisPATH=$PWD
#echo ' $thisPATH '$thisPATH;

# - set for this client a user-link in .local/bin
if [ ! -d $HOME/.local/bin ]; then
		mkdir $HOME/.local/bin
		chmod 700 $HOME/.local/bin
fi;
export PATH=$HOME/.local/bin:$PATH


if [ -h $HOME/.local/bin/tput_init-colors ]; then
      #echo " OK - symlink "$HOME"/.local/bin/tput_init-colors exists"
      . tput_init-colors;
      printf " ${dimgreen}OK ${grey}- nothing to do - ${dimyellow}%s${reset}\n" "tput_init-colors exists"
else
      ln -sfv $thisPATH/usr/lib/tput_init-colors.sh $HOME/.local/bin/tput_init-colors
      . tput_init-colors;
      printf " ${dimgreen}OK ${dimyellow}%s${reset}\n" $HOME"/.local/bin/tput_init-colors is ready"

fi;


if [ -h $HOME/.local/bin/ssh-export-id ]; then
#		echo " OK - symlink "$HOME"/.local/bin/ssh-export-id exists"
      printf " ${dimgreen}OK ${grey}- nothing to do - ${dimyellow}%s${reset}\n" "ssh-export-id exists"
else
      ln -sfv $thisPATH/usr/bin/ssh-export-id $HOME/.local/bin/ssh-export-id
      printf " ${dimgreen}OK ${dimyellow}%s${reset}\n" $HOME"/.local/bin/ssh-export-id is ready"
fi;


if [ -h $HOME/.local/bin/ssh-remove-id ]; then
      #echo " OK - symlink "$HOME"/.local/bin/ssh-remove-id exists"
      printf " ${dimgreen}OK ${grey}- nothing to do - ${dimyellow}%s${reset}\n" "ssh-remove-id exists"
else
      ln -sfv $thisPATH/usr/bin/ssh-remove-id $HOME/.local/bin/ssh-remove-id
      printf " ${dimgreen}OK ${dimyellow}%s${reset}\n" $HOME"/.local/bin/ssh-remove-id is ready"
fi;

exit 0
