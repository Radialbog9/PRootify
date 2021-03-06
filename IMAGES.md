# RootFS Image Files
All rootfs images, both mirrored and bootstrapped, are located here: https://files.rb9.xyz/prootify/rootfs/.

Some image files are bootstrapped manually, namely Debian-based distros (Ubuntu, Debian, Kali, Parrot, and Backbox), as opposed to being downloaded from other sources.
If you need to build these manually, it's quite simple:
```bash
# Install dependencies first!
sudo apt install wget qemu-user-static debian-archive-keyring debootstrap
# Build all images
wget -qO - https://raw.githubusercontent.com/Radialbog9/PRootify/main/bootstrap-images.sh | sudo bash
# Build all images but Parrot
BUILD_INCLUDE_PARROT=false wget -qO - https://raw.githubusercontent.com/Radialbog9/PRootify/main/bootstrap-images.sh | sudo bash
# Build all Parrot Images
BUILD_INCLUDE="parrot" wget -qO - https://raw.githubusercontent.com/Radialbog9/PRootify/main/bootstrap-images.sh | sudo bash
# Build amd64 Parrot image
BUILD_INCLUDE="parrot:amd64" wget -qO - https://raw.githubusercontent.com/Radialbog9/PRootify/main/bootstrap-images.sh | sudo bash
# Build all images but Parrot images
BUILD_INCLUDE_PARROT=false wget -qO - https://raw.githubusercontent.com/Radialbog9/PRootify/main/bootstrap-images.sh | sudo bash
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


## Source downloads
Here's the original links for all of the images mirrored from other locations (which we store [here](https://files.rb9.xyz/prootify/rootfs/)):
### Alpine
* [alpine-mini-rootfs-amd64.tar.gz](http://dl-cdn.alpinelinux.org/alpine/latest-stable/releases/x86_64/alpine-minirootfs-3.15.1-x86_64.tar.gz)
* [alpine-mini-rootfs-i386.tar.gz](http://dl-cdn.alpinelinux.org/alpine/latest-stable/releases/x86/alpine-minirootfs-3.15.1-x86.tar.gz)
* [alpine-mini-rootfs-armhf.tar.gz](http://dl-cdn.alpinelinux.org/alpine/latest-stable/releases/armhf/alpine-minirootfs-3.15.1-armhf.tar.gz)
* [alpine-mini-rootfs-arm64.tar.gz](http://dl-cdn.alpinelinux.org/alpine/latest-stable/releases/aarch64/alpine-minirootfs-3.15.1-aarch64.tar.gz)
### CentOS
* [centos-rootfs-amd64.tar.xz](https://raw.githubusercontent.com/EXALAB/Anlinux-Resources/master/Rootfs/CentOS/amd64/centos-rootfs-amd64.tar.xz)
* [centos-rootfs-i386.tar.xz](https://raw.githubusercontent.com/EXALAB/Anlinux-Resources/master/Rootfs/CentOS/i386/centos-rootfs-i386.tar.xz)
* [centos-rootfs-armhf.tar.xz](https://raw.githubusercontent.com/EXALAB/Anlinux-Resources/master/Rootfs/CentOS/armhf/centos-rootfs-armhf.tar.xz)
* [centos-rootfs-arm64.tar.xz](https://raw.githubusercontent.com/EXALAB/Anlinux-Resources/master/Rootfs/CentOS/arm64/centos-rootfs-arm64.tar.xz)
### Fedora (no i386 version available)
* [fedora-rootfs-amd64.tar.xz](https://raw.githubusercontent.com/EXALAB/Anlinux-Resources/master/Rootfs/Fedora/amd64/fedora-rootfs-amd64.tar.xz)
* [fedora-rootfs-armhf.tar.xz](https://raw.githubusercontent.com/EXALAB/Anlinux-Resources/master/Rootfs/Fedora/armhf/fedora-rootfs-armhf.tar.xz)
* [fedora-rootfs-arm64.tar.xz](https://raw.githubusercontent.com/EXALAB/Anlinux-Resources/master/Rootfs/Fedora/arm64/fedora-rootfs-arm64.tar.xz)
### Void
* [void-rootfs-amd64.tar.xz](https://alpha.de.repo.voidlinux.org/live/current/void-x86_64-ROOTFS-20210930.tar.xz)
* [void-rootfs-i386.tar.xz](https://alpha.de.repo.voidlinux.org/live/current/void-i686-ROOTFS-20210930.tar.xz)
* [void-rootfs-armhf.tar.xz](https://alpha.de.repo.voidlinux.org/live/current/void-armv7l-ROOTFS-20210930.tar.xz)
* [void-rootfs-arm64.tar.xz](https://alpha.de.repo.voidlinux.org/live/current/void-aarch64-ROOTFS-20210930.tar.xz)
### openSUSE (no i386 version available)
* [opensuse-leap-rootfs-amd64.tar.xz](https://raw.githubusercontent.com/EXALAB/Anlinux-Resources/master/Rootfs/openSUSE/Leap/amd64/openSUSE-Leap-rootfs-amd64.tar.xz)
* [opensuse-leap-rootfs-armhf.tar.xz](https://raw.githubusercontent.com/EXALAB/Anlinux-Resources/master/Rootfs/openSUSE/Leap/armhf/openSUSE-Leap-rootfs-armhf.tar.xz)
* [opensuse-leap-rootfs-arm64.tar.xz](https://raw.githubusercontent.com/EXALAB/Anlinux-Resources/master/Rootfs/openSUSE/Leap/arm64/openSUSE-Leap-rootfs-arm64.tar.xz)
* [opensuse-tumbleweed-rootfs-amd64.tar.xz](https://raw.githubusercontent.com/EXALAB/Anlinux-Resources/master/Rootfs/openSUSE/Tumbleweed/amd64/openSUSE-Tumbleweed-rootfs-amd64.tar.xz)
* [opensuse-tumbleweed-rootfs-armhf.tar.xz](https://raw.githubusercontent.com/EXALAB/Anlinux-Resources/master/Rootfs/openSUSE/Tumbleweed/armhf/openSUSE-Tumbleweed-rootfs-armhf.tar.xz)
* [opensuse-tumbleweed-rootfs-arm64.tar.xz](https://raw.githubusercontent.com/EXALAB/Anlinux-Resources/master/Rootfs/openSUSE/Tumbleweed/arm64/openSUSE-Tumbleweed-rootfs-arm64.tar.xz)
### Nethunter
* [nethunter-rootfs-amd64.tar.xz](https://build.nethunter.com/kalifs/kalifs-latest/kalifs-amd64-full.tar.xz)
* [nethunter-rootfs-i386.tar.xz](https://build.nethunter.com/kalifs/kalifs-latest/kalifs-i386-full.tar.xz)
* [nethunter-rootfs-armhf.tar.xz](https://build.nethunter.com/kalifs/kalifs-latest/kalifs-armhf-full.tar.xz)
* [nethunter-rootfs-arm64.tar.xz](https://build.nethunter.com/kalifs/kalifs-latest/kalifs-arm64-full.tar.xz)
