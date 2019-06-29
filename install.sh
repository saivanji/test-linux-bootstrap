#!/bin/bash

# set up the clock
timedatectl set-ntp true &&

# wipe all on the disk
sgdisk -Z /dev/sda &&
# create new partition table
sgdisk -a 2048 -o /dev/sda &&
# create boot partition
sgdisk -n 1:0:+512M /dev/sda &&
# create swap partition
sgdisk -n 2:0:+2G /dev/sda &&
# create main partition
sgdisk -n 3:0:0 /dev/sda &&
# set boot partition type
sgdisk -t 1:ef00 /dev/sda &&
# set swap partition type
sgdisk -t 2:8200 /dev/sda &&
# set main partition type
sgdisk -t 3:8300 /dev/sda &&

# format boot partition
mkfs.vfat /dev/sda1 &&
# format swap partition
mkswap /dev/sda2 &&
# format main partition
mkfs.ext4 /dev/sda3 &&
# enable swap
swapon /dev/sda2 &&

# mount main partition
mount /dev/sda3 /mnt &&
# create boot dir
mkdir /mnt/boot &&
# mount boot
mount /dev/sda1 /mnt/boot &&

# set repository mirror
echo Server = http://mirror.datacenter.by/pub/archlinux/\$repo/os/\$arch > /etc/pacman.d/mirrorlist &&

# install base packages
pacstrap /mnt base ansible git vim sudo &&

# generate fstab
genfstab -U /mnt >> /mnt/etc/fstab &&

cat << EOF | arch-chroot /mnt

# setting up a time
ln -sf /usr/share/zoneinfo/Europe/Minsk /etc/localtime &&
hwclock --systohc &&

# localization
echo "en_US.UTF-8 UTF-8" > /etc/locale.gen &&
locale-gen &&
echo LANG=en_US.UTF-8 >> /etc/locale.conf &&

# network
echo "personal" > /etc/hostname &&
printf "127.0.0.1 localhost\n::1 localhost\n127.0.1.1 personal.localdomain personal" > /etc/hosts &&
systemctl enable dhcpcd &&

# bootloader
bootctl install &&
printf "default arch\ntimeout 4" > /boot/loader/loader.conf &&
printf "title Arch Linux\nlinux /vmlinuz-linux\ninitrd /initramfs-linux.img\noptions root=UUID=$(blkid -s UUID -o value /dev/sda3) rw" > /boot/loader/entries/arch.conf &&

# users
echo root:$3 | chpasswd &&
useradd -m -G wheel $1 &&
echo $1:$2 | chpasswd &&
echo 'wheel ALL=(ALL) ALL' | EDITOR='tee -a' visudo

EOF
