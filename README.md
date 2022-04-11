# PRootify
Easy scripts to run Linux distros in PRoot. It's like a virtual machine, but without a hypervisor or any root access!

## Usage
Firstly, install dependencies. All you need is `wget`, `whiptail`, and `proot`. Here's how to install those on any Debian-based distro (Debian, Ubuntu, Kali, etc):
```bash
sudo apt install wget whiptail proot -y
```
Then, download and run the script. Note that this does not have to be done with sudo or root permissions:
```bash
wget -qO - https://raw.githubusercontent.com/Radialbog9/PRootify/main/prootify.sh | bash
```
From there, you can install and remove distros, and automatically add optional features in 1 click.

## How it Works
> PRoot is a user-space implementation of `chroot`, `mount --bind`, and `binfmt_misc`. This means users don't need any privileges or setup to do things like using an arbitrary directory as the new root filesystem...

We use PRoot to be able to run any Linux distro on any Linux system without reinstalls or virtualization.

## RootFS Images
Check [here](https://github.com/Radialbog9/PRootify/blob/main/IMAGES.md) for the details on rootfs images, where they're stored, and how to build them.

## Credits
[AnLinux](https://github.com/EXALAB/AnLinux-App/) was the starting point for this project, so thanks to them!