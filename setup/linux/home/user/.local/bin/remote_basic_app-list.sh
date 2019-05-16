#! /bin/bash
#
# Pfade relativ zum dirBASE=./ (Files ohne beginnenden slash)

# the apps array 
declare -a APPS=(
                "console-common"
                "console-data"
                "fontconfig"
                "fontconfig-config"
                "fonts-dejavu"
                "fonts-dejavu-core"
                "fonts-dejavu-extra"
                "fonts-liberation"
                "fonts-ubuntu"
                "ntpdate"
                "lynx"
                "lynx-common"
                "lzma"
                "ntpdate"
                "nmap"
                "multitail"
                "tmate"              # instant terminal sharing
                "traceroute"
                "whois"
                "zip"
                );
# get the arraykeys
KEYS=(${!APPS[@]});
#
#
