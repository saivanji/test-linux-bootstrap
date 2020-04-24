#!/bin/bash

echo "Enter disk name"
read DISK_NAME

# set up the clock
timedatectl set-ntp true &&

# wipe all on the disk
sgdisk -Z $DISK_NAME &&
# create new partition table
sgdisk -a 2048 -o $DISK_NAME &&
# create boot partition
sgdisk -n 1:0:+512M $DISK_NAME &&
# create swap partition
sgdisk -n 2:0:+2G $DISK_NAME &&
# create main partition
sgdisk -n 3:0:0 $DISK_NAME &&
# set boot partition type
sgdisk -t 1:ef00 $DISK_NAME &&
# set swap partition type
sgdisk -t 2:8200 $DISK_NAME &&
# set main partition type
sgdisk -t 3:8300 $DISK_NAME &&

# format boot partition
mkfs.vfat $DISK_NAME"1" &&
# format swap partition
mkswap $DISK_NAME"2" &&
# format main partition
mkfs.ext4 $DISK_NAME"3" &&
# enable swap
swapon $DISK_NAME"2" &&

# mount main partition
mount $DISK_NAME"3" /mnt &&
# create boot dir
mkdir /mnt/boot &&
# mount boot
mount $DISK_NAME"1" /mnt/boot &&

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
