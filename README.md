# Installation

1. Being on the loaded arch installation system, clone this repository.
2. Rename group_vars/all.sample.yml to group_vars/all.yml
3. Run `./install.sh`
4. Chroot into the installed system and run `passwd` and `passwd <username>` to set passwords for the users. And `ssh-keygen -p -f /home/<username>/.ssh/id_dsa` to set passphrase for ssh key

# Networking

## Ethernet

Having cable connected, run:

```
sudo systemctl enable dhcpcd.service
```

Reboot in order to have changes applied

## WiFi

Run `sudo wifi-menu` and after you choose network and enter the password, run:

```
sudo netctl enable <generated_profile>
```

Reboot in order to have changes applied
