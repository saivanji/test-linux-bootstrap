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
echo Server = http://mirror.datacenter.by/pub/archlinux/$repo/os/$arch >> /etc/pacman.d/mirrorlist &&

# install base packages
pacstrap /mnt base ansible git &&

# generate fstab
genfstab -U /mnt >> /mnt/etc/fstab &&

echo "Arch linux was installed successfully"
