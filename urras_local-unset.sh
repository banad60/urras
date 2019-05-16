#!/bin/bash
# benutzung: 
#    - localer user, der auf dem server einen priveligierten useraccout hat
#
# SSH_AUTH_SOCK

export thisPATH=$PWD

# - set for this client a user-link in .local/bin
if [ -h $HOME/.local/bin/tput_init-colors ]; then
		rm -v $HOME/.local/bin/tput_init-colors
else
		echo " NO   symlink "$HOME"/.local/bin/tput_init-colors"
fi;

if [ -h $HOME/.local/bin/ssh-export-id ]; then
		rm -v $HOME/.local/bin/ssh-export-id
else
		echo " NO   symlink "$HOME"/.local/bin/ssh-export-id"
fi;

if [ -h $HOME/.local/bin/ssh-remove-id ]; then
		rm -v $HOME/.local/bin/ssh-remove-id
else
		echo " NO   symlink "$HOME"/.local/bin/ssh-remove-id"
fi;

exit 0
