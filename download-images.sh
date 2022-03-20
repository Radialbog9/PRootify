# ############################## #
# PRootify                       #
# by Radialbog9                  #
# License: GNU GPL3              #
# File: download-images.sh       #
# ############################## #

# Alpine
wget -O alpine-mini-rootfs-amd64.tar.gz http://dl-cdn.alpinelinux.org/alpine/latest-stable/releases/x86_64/alpine-minirootfs-3.15.1-x86_64.tar.gz
wget -O alpine-mini-rootfs-i386.tar.gz http://dl-cdn.alpinelinux.org/alpine/latest-stable/releases/x86/alpine-minirootfs-3.15.1-x86.tar.gz
wget -O alpine-mini-rootfs-armhf.tar.gz http://dl-cdn.alpinelinux.org/alpine/latest-stable/releases/armhf/alpine-minirootfs-3.15.1-armhf.tar.gz
wget -O alpine-mini-rootfs-arm64.tar.gz http://dl-cdn.alpinelinux.org/alpine/latest-stable/releases/aarch64/alpine-minirootfs-3.15.1-aarch64.tar.gz

# CentOS
wget -O centos-rootfs-amd64.tar.xz https://raw.githubusercontent.com/EXALAB/Anlinux-Resources/master/Rootfs/CentOS/amd64/centos-rootfs-amd64.tar.xz
wget -O centos-rootfs-i386.tar.xz https://raw.githubusercontent.com/EXALAB/Anlinux-Resources/master/Rootfs/CentOS/i386/centos-rootfs-i386.tar.xz
wget -O centos-rootfs-armhf.tar.xz https://raw.githubusercontent.com/EXALAB/Anlinux-Resources/master/Rootfs/CentOS/armhf/centos-rootfs-armhf.tar.xz
wget -O centos-rootfs-arm64.tar.xz https://raw.githubusercontent.com/EXALAB/Anlinux-Resources/master/Rootfs/CentOS/arm64/centos-rootfs-arm64.tar.xz

# Fedora
wget -O fedora-rootfs-amd64.tar.xz https://raw.githubusercontent.com/EXALAB/Anlinux-Resources/master/Rootfs/Fedora/amd64/fedora-rootfs-amd64.tar.xz
# - No i386 version
wget -O fedora-rootfs-armhf.tar.xz https://raw.githubusercontent.com/EXALAB/Anlinux-Resources/master/Rootfs/Fedora/armhf/fedora-rootfs-armhf.tar.xz
wget -O fedora-rootfs-arm64.tar.xz https://raw.githubusercontent.com/EXALAB/Anlinux-Resources/master/Rootfs/Fedora/arm64/fedora-rootfs-arm64.tar.xz

# Void
wget -O void-rootfs-amd64.tar.xz https://alpha.de.repo.voidlinux.org/live/current/void-x86_64-ROOTFS-20210930.tar.xz
wget -O void-rootfs-i386.tar.xz https://alpha.de.repo.voidlinux.org/live/current/void-i686-ROOTFS-20210930.tar.xz
wget -O void-rootfs-armhf.tar.xz https://alpha.de.repo.voidlinux.org/live/current/void-armv7l-ROOTFS-20210930.tar.xz
wget -O void-rootfs-arm64.tar.xz https://alpha.de.repo.voidlinux.org/live/current/void-aarch64-ROOTFS-20210930.tar.xz

# openSUSE
wget -O opensuse-leap-rootfs-amd64.tar.xz https://raw.githubusercontent.com/EXALAB/Anlinux-Resources/master/Rootfs/openSUSE/Leap/amd64/openSUSE-Leap-rootfs-amd64.tar.xz
# - No i386 version
wget -O opensuse-leap-rootfs-armhf.tar.xz https://raw.githubusercontent.com/EXALAB/Anlinux-Resources/master/Rootfs/openSUSE/Leap/armhf/openSUSE-Leap-rootfs-armhf.tar.xz
wget -O opensuse-leap-rootfs-arm64.tar.xz https://raw.githubusercontent.com/EXALAB/Anlinux-Resources/master/Rootfs/openSUSE/Leap/arm64/openSUSE-Leap-rootfs-arm64.tar.xz

wget -O opensuse-tumbleweed-rootfs-amd64.tar.xz https://raw.githubusercontent.com/EXALAB/Anlinux-Resources/master/Rootfs/openSUSE/Tumbleweed/amd64/openSUSE-Tumbleweed-rootfs-amd64.tar.xz
# - No i386 version
wget -O opensuse-tumbleweed-rootfs-armhf.tar.xz https://raw.githubusercontent.com/EXALAB/Anlinux-Resources/master/Rootfs/openSUSE/Tumbleweed/armhf/openSUSE-Tumbleweed-rootfs-armhf.tar.xz
wget -O opensuse-tumbleweed-rootfs-arm64.tar.xz https://raw.githubusercontent.com/EXALAB/Anlinux-Resources/master/Rootfs/openSUSE/Tumbleweed/arm64/openSUSE-Tumbleweed-rootfs-arm64.tar.xz

# Nethunter
wget -O nethunter-rootfs-amd64.tar.xz https://build.nethunter.com/kalifs/kalifs-latest/kalifs-amd64-full.tar.xz
wget -O nethunter-rootfs-i386.tar.xz https://build.nethunter.com/kalifs/kalifs-latest/kalifs-i386-full.tar.xz
wget -O nethunter-rootfs-armhf.tar.xz https://build.nethunter.com/kalifs/kalifs-latest/kalifs-armhf-full.tar.xz
wget -O nethunter-rootfs-arm64.tar.xz https://build.nethunter.com/kalifs/kalifs-latest/kalifs-arm64-full.tar.xz