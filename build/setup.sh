#!/bin/bash 

source ./env.sh

## setup busybox env 
#  enter working directory 
cd $BUSYBOX_INSTALL
#  creating necessary directories
mkdir -p proc sys dev etc etc/init.d
touch etc/init.d/rcS
chmod +x etc/init.d/rcS 
touch etc/passwd

#  write into init script
cat << ENDER > etc/init.d/rcS 
#!/bin/sh
# startup script
mount -t proc none /proc
mount -t sysfs none /sys
/sbin/mdev -s
mkdir /tmp
chmod 777 -R /tmp
adduser ctf
su ctf
ENDER

#building file system.
find . | cpio -o --format=newc > ../rootfs.img

