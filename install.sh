#!/bin/bash

echo "Enter disk name"
read DISK_NAME
echo "Enter boot partition name"
read BOOT_PARTITION_NAME
echo "Enter swap partition name"
read SWAP_PARTITION_NAME
echo "Enter system partition name"
read SYS_PARTITION_NAME

# set up the clock
timedatectl set-ntp true &&

# wipe all data on the disk
sgdisk -Z "/dev/"$DISK_NAME &&
# create new partition table
sgdisk -a 2048 -o "/dev/"$DISK_NAME &&
# create boot partition
sgdisk -n 1:0:+512M "/dev/"$DISK_NAME &&
# create swap partition
sgdisk -n 2:0:+2G "/dev/"$DISK_NAME &&
# create main partition
sgdisk -n 3:0:0 "/dev/"$DISK_NAME &&
# set boot partition type
sgdisk -t 1:ef00 "/dev/"$DISK_NAME &&
# set swap partition type
sgdisk -t 2:8200 "/dev/"$DISK_NAME &&
# set main partition type
sgdisk -t 3:8300 "/dev/"$DISK_NAME &&

# format boot partition
mkfs.vfat "/dev/"$BOOT_PARTITION_NAME &&
# format swap partition
mkswap "/dev/"$SWAP_PARTITION_NAME &&
# format main partition
mkfs.ext4 "/dev/"$SYS_PARTITION_NAME &&
# enable swap
swapon "/dev/"$SWAP_PARTITION_NAME &&

# mount main partition
mount "/dev/"$SYS_PARTITION_NAME /mnt &&
# create boot dir
mkdir /mnt/boot &&
# mount boot
mount "/dev/"$BOOT_PARTITION_NAME /mnt/boot &&

# set repository mirror
echo Server = http://mirror.datacenter.by/pub/archlinux/\$repo/os/\$arch > /etc/pacman.d/mirrorlist &&

# install base packages
pacstrap /mnt base linux linux-firmware ansible git rsync sudo &&

# generate fstab
genfstab -U /mnt >> /mnt/etc/fstab &&

# copy installation files to the root dir
cp -r $(dirname "$0") /mnt/root/bootstrap/ &&

cat << EOF | arch-chroot /mnt

# run playbook
ansible-playbook /root/bootstrap/playbook.yml &&

# remove bootstrap
rm -rf /root/bootstrap

EOF
