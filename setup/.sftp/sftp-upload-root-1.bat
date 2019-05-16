lcd setup/linux/root
lpwd
pwd
put -p .bashrc
put -p .profile
#------------------------------------------------------#
-mkdir .config
-chmod 700 .config
cd .config
pwd
-mkdir mc
-chmod 700 mc
cd mc
pwd
put -pr .config/mc/*
#------------------------------------------------------#
lcd ../etc
lpwd
pwd
cd ../../../etc
pwd
put -pr *
#-ln -s /etc/mc/mc.default.keymap /etc/mc/mc.keymap
#------------------------------------------------------#
lcd ../../../usr
lpwd
cd ../opt
pwd
-mkdir urras
-chmod 755 urras
#------------------------------------------------------#
cd urras
pwd
# -mkdir server
# -chmod 755 server
-mkdir client
-chmod 755 client
cd client
pwd
put -pr *
#------------------------------------------------------#
-ln -s /opt/urras/client/lib/tput_init-colors.sh /usr/bin/tput_init-colors
-ln -s /opt/urras/client/bin/ssh-export-id /usr/bin/ssh-export-id
-ln -s /opt/urras/client/bin/ssh-remove-id /usr/bin/ssh-remove-id
#------------------------------------------------------#
exit
