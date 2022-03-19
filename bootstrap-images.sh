# ############################## #
# PRootify                       #
# by Radialbog9                  #
# License: GNU GPL3              #
# File: bootstrap-images.sh      #
# ############################## #

mkdir -p $PWD/.tmp/scripts/
wget -O $PWD/.tmp/scripts/backbox.sh https://raw.githubusercontent.com/Radialbog9/PRootify/main/bootstrap-scripts/backbox.sh
wget -O $PWD/.tmp/scripts/debian.sh https://raw.githubusercontent.com/Radialbog9/PRootify/main/bootstrap-scripts/debian.sh
wget -O $PWD/.tmp/scripts/kali.sh https://raw.githubusercontent.com/Radialbog9/PRootify/main/bootstrap-scripts/kali.sh
wget -O $PWD/.tmp/scripts/parrot.sh https://raw.githubusercontent.com/Radialbog9/PRootify/main/bootstrap-scripts/parrot.sh
wget -O $PWD/.tmp/scripts/ubuntu.sh https://raw.githubusercontent.com/Radialbog9/PRootify/main/bootstrap-scripts/ubuntu.sh

chmod +x $PWD/.tmp/scripts/*

mkdir -p $PWD/.tmp/{backbox,debian,kali,parrot,ubuntu}

$PWD/.tmp/scripts/backbox.sh arm64 $PWD/.tmp/backbox/arm64
$PWD/.tmp/scripts/backbox.sh armhf $PWD/.tmp/backbox/armhf
$PWD/.tmp/scripts/backbox.sh amd64 $PWD/.tmp/backbox/amd64
$PWD/.tmp/scripts/backbox.sh i386 $PWD/.tmp/backbox/i386
$PWD/.tmp/backbox/*.tar.xz $PWD

$PWD/.tmp/scripts/debian.sh arm64 $PWD/.tmp/debian/arm64
$PWD/.tmp/scripts/debian.sh armhf $PWD/.tmp/debian/armhf
$PWD/.tmp/scripts/debian.sh amd64 $PWD/.tmp/debian/amd64
$PWD/.tmp/scripts/debian.sh i386 $PWD/.tmp/debian/i386
$PWD/.tmp/debian/*.tar.xz $PWD

$PWD/.tmp/scripts/kali.sh arm64 $PWD/.tmp/kali/arm64
$PWD/.tmp/scripts/kali.sh armhf $PWD/.tmp/kali/armhf
$PWD/.tmp/scripts/kali.sh amd64 $PWD/.tmp/kali/amd64
$PWD/.tmp/scripts/kali.sh i386 $PWD/.tmp/kali/i386
$PWD/.tmp/kali/*.tar.xz $PWD

$PWD/.tmp/scripts/parrot.sh arm64 $PWD/.tmp/parrot/arm64
$PWD/.tmp/scripts/parrot.sh armhf $PWD/.tmp/parrot/armhf
$PWD/.tmp/scripts/parrot.sh amd64 $PWD/.tmp/parrot/amd64
$PWD/.tmp/scripts/parrot.sh i386 $PWD/.tmp/parrot/i386
$PWD/.tmp/parrot/*.tar.xz $PWD

$PWD/.tmp/scripts/ubuntu.sh arm64 $PWD/.tmp/ubuntu/arm64
$PWD/.tmp/scripts/ubuntu.sh armhf $PWD/.tmp/ubuntu/armhf
$PWD/.tmp/scripts/ubuntu.sh amd64 $PWD/.tmp/ubuntu/amd64
$PWD/.tmp/scripts/ubuntu.sh i386 $PWD/.tmp/ubuntu/i386
$PWD/.tmp/ubuntu/*.tar.xz $PWD

rm -rd .tmp/