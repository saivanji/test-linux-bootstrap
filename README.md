# Installation

1. Being on the loaded arch installation system, clone this repository.
2. Rename group_vars/all.sample.yml to group_vars/all.yml
3. Run `./install.sh`. After it finishes successfully, chroot into the installed system and run `passwd` and `passwd <username>` to set passwords.

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
