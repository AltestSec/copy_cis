#!/bin/bash
export PS1="(chroot) $PS1"
path="/home/nixadmin/nix-benchmark"
mount_path="/mnt/ext_storage/rootfs"
username_path="/mnt/ext_storage/rootfs/home/test"

if [ -e "$username_path" ]
then
echo "$username_path exist"
else
echo "destination folder does not exist. Creating ....."  && $(mkdir -p $(echo "$username_path"))
fi

test_home="/mnt/ext_storage/rootfs/home/test"
test_dir="/mnt/ext_storage/rootfs/home/test/nix-benchmark"
test_path="/home/test"
l_test_dir="/home/test/nix-benchmark"
if [ -e "$mount_path" ]
then
echo "$mount_path exist"
else
echo "destination folder does not exist. Creating ....."  && $(mkdir -p $(echo "$mount_path"))
fi




cd $mount_path
test_home="$mount_path/home/test"
mkdir $test_home
cp -r $path $test_home
chmod +x $test_dir/run-cis-ubuntu.sh
exec chroot $mount_path /bin/bash << EOF1
cd $l_test_dir
./run-cis-ubuntu.sh
exit
EOF1
