# Installation

1. Being on the loaded arch installation system, clone this repository.
2. Rename group_vars/all.sample.yml to group_vars/all.yml
3. Run `./install.sh`
4. Chroot into the installed system and run `passwd` and `passwd <username>` to set passwords for the users.

# Post install

## Docker

Enable docker service:

```
sudo systemctl enable docker
```

## SSH

Run the command below for generating ssh key:

```
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```

In order to have ssh running after system boot, enable the following systemd service:

```
systemctl --user enable ssh-agent.service
```

## Bluetooth

Load `modprobe` kernel module:

```
sudo modprobe btusb
```

Enable bluetooth service:

```
sudo systemctl enable bluetooth
```

## Networking

### Ethernet

Having cable connected, run:

```
sudo systemctl enable dhcpcd.service
```

Reboot in order to have changes applied

### WiFi

Run `sudo wifi-menu` and after you choose network and enter the password, run:

```
sudo netctl enable <generated_profile>
```

Reboot in order to have changes applied

## Aur packages

For every directory in ~/Aur run `makepkg -si` as a normal user to download and install aur packages

## Proprietary packages

- Slack. Temporary un-jail slack with `sudo rm /usr/local/bin/slack` command sign in with Firefox and apply playbook again to jail it back.

## NeoVim

- Execute `rustup component add rls rust-analysis rust-src` command in terminal
- Run :PlugInstall
- Run :CocInstall coc-tsserver coc-eslint coc-json coc-html coc-css coc-highlight coc-rls

## Virtualization

Define "virt: true" in "all.yml" file

Start the following services after the installation:

```
systemctl start libvirtd.service
```

and

```
systemctl start virtlogd.service
```

Start default network

```
virsh net-start default
```

Follow the guide at https://dennisnotes.com/note/20180614-ubuntu-18.04-qemu-setup/ with the exception of skipping the step 8 (network configuration)
