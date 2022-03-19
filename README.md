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
Some image files are bootstrapped manually, namely Debian-based distros (Ubuntu, Debian, Kali, Parrot, and Blackbox), as opposed to being downloaded from other sources.
RootFS images are available [here](https://files.rb9.xyz/prootify/rootfs/), but if you need to build these manually, it's quite simple:
```bash
# Install dependencies first!
sudo apt install wget qemu-user-static debian-archive-keyring debootstrap
# Build all images
wget -qO - https://raw.githubusercontent.com/Radialbog9/PRootify/main/bootstrap-images.sh | sudo bash
# Build all images but Parrot
BUILD_INCLUDE_PARROT=false wget -qO - https://raw.githubusercontent.com/Radialbog9/PRootify/main/bootstrap-images.sh | sudo bash
# Build all Parrot Images
BUILD_INCLUDE=(parrot) wget -qO - https://raw.githubusercontent.com/Radialbog9/PRootify/main/bootstrap-images.sh | sudo bash
```

If you get this error while building Parrot:
```
E: No such script: /usr/share/debootstrap/scripts/parrot-rolling
```
Then download the Parrot rolling script like this (this is a hacky solution and is by no means recommended):
```bash
sudo wget -O /usr/share/debootstrap/scripts/parrot-rolling https://raw.githubusercontent.com/ParrotSec/debootstrap/master/scripts/parrot-rolling
sudo ln -sr /usr/share/debootstrap/scripts/parrot-rolling /usr/share/debootstrap/scripts/rolling
```

## Credits
[AnLinux](https://github.com/EXALAB/AnLinux-App/) as the starting point for this project, so thanks to them!