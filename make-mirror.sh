# ############################## #
# PRootify                       #
# by Radialbog9                  #
# License: GNU GPL3              #
# File: make-mirror.sh           #
# ############################## #

host=https://files.rb9.xyz/prootify/

cat > /tmp/prootify_mirror_filelist.txt <<- EOM
alpine-mini-rootfs-amd64.tar.gz
alpine-mini-rootfs-arm64.tar.gz
alpine-mini-rootfs-armhf.tar.gz
alpine-mini-rootfs-i386.tar.gz
backbox-rootfs-amd64.tar.xz
backbox-rootfs-arm64.tar.xz
backbox-rootfs-armhf.tar.xz
backbox-rootfs-i386.tar.xz
centos-rootfs-amd64.tar.xz
centos-rootfs-arm64.tar.xz
centos-rootfs-armhf.tar.xz
centos-rootfs-i386.tar.xz
debian-rootfs-amd64.tar.xz
debian-rootfs-arm64.tar.xz
debian-rootfs-armhf.tar.xz
debian-rootfs-i386.tar.xz
fedora-rootfs-amd64.tar.xz
fedora-rootfs-arm64.tar.xz
fedora-rootfs-armhf.tar.xz
kali-rootfs-amd64.tar.xz
kali-rootfs-arm64.tar.xz
kali-rootfs-armhf.tar.xz
kali-rootfs-i386.tar.xz
nethunter-rootfs-amd64.tar.xz
nethunter-rootfs-arm64.tar.xz
nethunter-rootfs-armhf.tar.xz
nethunter-rootfs-i386.tar.xz
opensuse-leap-rootfs-amd64.tar.xz
opensuse-leap-rootfs-arm64.tar.xz
opensuse-leap-rootfs-armhf.tar.xz
opensuse-tumbleweed-rootfs-amd64.tar.xz
opensuse-tumbleweed-rootfs-arm64.tar.xz
opensuse-tumbleweed-rootfs-armhf.tar.xz
parrot-rootfs-amd64.tar.xz
parrot-rootfs-arm64.tar.xz
parrot-rootfs-armhf.tar.xz
parrot-rootfs-i386.tar.xz
ubuntu-rootfs-amd64.tar.xz
ubuntu-rootfs-arm64.tar.xz
ubuntu-rootfs-armhf.tar.xz
ubuntu-rootfs-i386.tar.xz
void-rootfs-amd64.tar.xz
void-rootfs-arm64.tar.xz
void-rootfs-armhf.tar.xz
void-rootfs-i386.tar.xz
EOM

for file in `cat /tmp/prootify_mirror_filelist.txt`; 
do
    wget $host/$file
done

rm /tmp/prootify_mirror_filelist.txt