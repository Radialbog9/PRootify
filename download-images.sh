# ############################## #
# PRootify                       #
# by Radialbog9                  #
# License: GNU GPL3              #
# File: download-images.sh       #
# ############################## #

mkdir -p rootfs
rm -r rootfs/*

# Alpine
wget -O rootfs/alpine-mini-rootfs-amd64.tar.gz http://dl-cdn.alpinelinux.org/alpine/latest-stable/releases/x86_64/alpine-minirootfs-3.15.1-x86_64.tar.gz
wget -O rootfs/alpine-mini-rootfs-i386.tar.gz http://dl-cdn.alpinelinux.org/alpine/latest-stable/releases/x86/alpine-minirootfs-3.15.1-x86.tar.gz
wget -O rootfs/alpine-mini-rootfs-armhf.tar.gz http://dl-cdn.alpinelinux.org/alpine/latest-stable/releases/armhf/alpine-minirootfs-3.15.1-armhf.tar.gz
wget -O rootfs/alpine-mini-rootfs-arm64.tar.gz http://dl-cdn.alpinelinux.org/alpine/latest-stable/releases/aarch64/alpine-minirootfs-3.15.1-aarch64.tar.gz

# CentOS
wget -O rootfs/centos-rootfs-amd64.tar.xz https://raw.githubusercontent.com/EXALAB/Anlinux-Resources/master/Rootfs/CentOS/amd64/centos-rootfs-amd64.tar.xz
wget -O rootfs/centos-rootfs-i386.tar.xz https://raw.githubusercontent.com/EXALAB/Anlinux-Resources/master/Rootfs/CentOS/i386/centos-rootfs-i386.tar.xz
wget -O rootfs/centos-rootfs-armhf.tar.xz https://raw.githubusercontent.com/EXALAB/Anlinux-Resources/master/Rootfs/CentOS/armhf/centos-rootfs-armhf.tar.xz
wget -O rootfs/centos-rootfs-arm64.tar.xz https://raw.githubusercontent.com/EXALAB/Anlinux-Resources/master/Rootfs/CentOS/arm64/centos-rootfs-arm64.tar.xz

# Fedora
wget -O rootfs/fedora-rootfs-amd64.tar.xz https://raw.githubusercontent.com/EXALAB/Anlinux-Resources/master/Rootfs/Fedora/amd64/fedora-rootfs-amd64.tar.xz
# - No i386 version
wget -O rootfs/fedora-rootfs-armhf.tar.xz https://raw.githubusercontent.com/EXALAB/Anlinux-Resources/master/Rootfs/Fedora/armhf/fedora-rootfs-armhf.tar.xz
wget -O rootfs/fedora-rootfs-arm64.tar.xz https://raw.githubusercontent.com/EXALAB/Anlinux-Resources/master/Rootfs/Fedora/arm64/fedora-rootfs-arm64.tar.xz

# Void
wget -O rootfs/void-rootfs-amd64.tar.xz https://alpha.de.repo.voidlinux.org/live/current/void-x86_64-ROOTFS-20210930.tar.xz
wget -O rootfs/void-rootfs-i386.tar.xz https://alpha.de.repo.voidlinux.org/live/current/void-i686-ROOTFS-20210930.tar.xz
wget -O rootfs/void-rootfs-armhf.tar.xz https://alpha.de.repo.voidlinux.org/live/current/void-armv7l-ROOTFS-20210930.tar.xz
wget -O rootfs/void-rootfs-arm64.tar.xz https://alpha.de.repo.voidlinux.org/live/current/void-aarch64-ROOTFS-20210930.tar.xz

# openSUSE
wget -O rootfs/opensuse-leap-rootfs-amd64.tar.xz https://raw.githubusercontent.com/EXALAB/Anlinux-Resources/master/Rootfs/openSUSE/Leap/amd64/openSUSE-Leap-rootfs-amd64.tar.xz
# - No i386 version
wget -O rootfs/opensuse-leap-rootfs-armhf.tar.xz https://raw.githubusercontent.com/EXALAB/Anlinux-Resources/master/Rootfs/openSUSE/Leap/armhf/openSUSE-Leap-rootfs-armhf.tar.xz
wget -O rootfs/opensuse-leap-rootfs-arm64.tar.xz https://raw.githubusercontent.com/EXALAB/Anlinux-Resources/master/Rootfs/openSUSE/Leap/arm64/openSUSE-Leap-rootfs-arm64.tar.xz

wget -O rootfs/opensuse-tumbleweed-rootfs-amd64.tar.xz https://raw.githubusercontent.com/EXALAB/Anlinux-Resources/master/Rootfs/openSUSE/Tumbleweed/amd64/openSUSE-Tumbleweed-rootfs-amd64.tar.xz
# - No i386 version
wget -O rootfs/opensuse-tumbleweed-rootfs-armhf.tar.xz https://raw.githubusercontent.com/EXALAB/Anlinux-Resources/master/Rootfs/openSUSE/Tumbleweed/armhf/openSUSE-Tumbleweed-rootfs-armhf.tar.xz
wget -O rootfs/opensuse-tumbleweed-rootfs-arm64.tar.xz https://raw.githubusercontent.com/EXALAB/Anlinux-Resources/master/Rootfs/openSUSE/Tumbleweed/arm64/openSUSE-Tumbleweed-rootfs-arm64.tar.xz

# Nethunter
wget -O rootfs/nethunter-rootfs-amd64.tar.xz https://build.nethunter.com/kalifs/kalifs-latest/kalifs-amd64-full.tar.xz
wget -O rootfs/nethunter-rootfs-i386.tar.xz https://build.nethunter.com/kalifs/kalifs-latest/kalifs-i386-full.tar.xz
wget -O rootfs/nethunter-rootfs-armhf.tar.xz https://build.nethunter.com/kalifs/kalifs-latest/kalifs-armhf-full.tar.xz
wget -O rootfs/nethunter-rootfs-arm64.tar.xz https://build.nethunter.com/kalifs/kalifs-latest/kalifs-arm64-full.tar.xz