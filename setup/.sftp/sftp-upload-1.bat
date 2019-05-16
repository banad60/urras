#------------------------------------------------------#
lcd setup/linux/home/user
lpwd
pwd
put -p .bashrc
put -p .profile
#------------------------------------------------------#
-mkdir .local
-chmod 700 .local
cd .local
pwd
-mkdir bin
-chmod 700 bin
cd bin
pwd
put -p .local/bin/remote_add-sudoer.sh
put -p .local/bin/remote_cp-id_root.sh
put -p .local/bin/remote_remove-sudoer.sh
put -p .local/bin/remote_basic_app-list.sh
put -p .local/bin/remote_basic_apps
lpwd
cd ../../
pwd
-mkdir .config
-chmod 700 .config
cd .config
pwd
-mkdir mc
-chmod 700 mc
cd ../.config/mc
pwd
put -pr .config/mc/*
#------------------------------------------------------#
exit
