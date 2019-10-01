#!/bin/bash
export PS1="(chroot) $PS1"
path="/home/nixadmin/nix-benchmark"
mount_path="/mnt/ext_storage/rootfs"
username_path="/mnt/ext_storage/rootfs/home/test"

#if [ -e "$username_path" ]
#then
#echo "$username_path exist"
#else
#echo "destination folder does not exist. Creating ....."  && $(mkdir -p $(echo "$username_path"))
#fi

test_home="/mnt/ext_storage/rootfs/home/test"
test_dir="/mnt/ext_storage/rootfs/home/test/nix-benchmark"
test_path="/home/test"
l_test_dir="/home/test/nix-benchmark"
#if [ -e "$mount_path" ]
#then
#echo "$mount_path exist"
#else
#echo "destination folder does not exist. Creating ....."  && $(mkdir -p $(echo "$mount_path"))
#fi


test_home="$mount_path/home/test"
mkdir -p /mnt/ext_storage/rootfs/home/nixadmin/nix-benchmark
cd /mnt/ext_storage/rootfs
cp -r /home/nixadmin/nix-benchmark/ubuntu/* /mnt/ext_storage/rootfs/home/nixadmin/nix-benchmark
exec chroot /mnt/ext_storage/rootfs /bin/bash << EOF1
cd /home/nixadmin/nix-benchmark
./run-cis.sh
exit
EOF1
