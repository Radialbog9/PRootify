# ############################## #
# PRootify                       #
# by Radialbog9                  #
# License: GNU GPL3              #
# File: bootstrap-images.sh      #
# ############################## #

# bootstrapdist <name> <arch> <scripturl> <dir>
function bootstrapdist () {
    # wget -qO <url> | bash -s -- <arch> <dir>/<name>/<arch>
    wget -qO - $3 | bash -s -- $2 $4/$1/$2
    # echo wget -qO - $3 bash -s -- $2 $4/$1/$2
}


output_dir=${BUILD_OUTPUT:-$PWD}
temp_dir=${BUILD_TEMP:-"$PWD/.tmp"}

include_backbox=${BUILD_INCLUDE_BACKBOX:-true}
include_debian=${BUILD_INCLUDE_DEBIAN:-true}
include_kali=${BUILD_INCLUDE_KALI:-true}
include_parrot=${BUILD_INCLUDE_PARROT:-true}
include_ubuntu=${BUILD_INCLUDE_UBUNTU:-true}

build_distros=()

if [ $include_backbox == "true" ]; then build_distros+=("backbox"); fi
if [ $include_debian == "true" ]; then build_distros+=("debian"); fi
if [ $include_kali == "true" ]; then build_distros+=("kali"); fi
if [ $include_parrot == "true" ]; then build_distros+=("parrot"); fi
if [ $include_ubuntu == "true" ]; then build_distros+=("ubuntu"); fi

if [ ! -z "$BUILD_INCLUDE" ];
then
    build_distros=($BUILD_INCLUDE)
fi

IFS=$'\001'

if [[ "$IFS${build_distros[*]}$IFS" =~ "${IFS}backbox${IFS}" ]]; then build_distros+=("backbox:arm64" "backbox:armhf" "backbox:amd64"  "backbox:i386"); fi
if [[ "$IFS${build_distros[*]}$IFS" =~ "${IFS}debian${IFS}" ]]; then build_distros+=("debian:arm64" "debian:armhf" "debian:amd64"  "debian:i386"); fi
if [[ "$IFS${build_distros[*]}$IFS" =~ "${IFS}kali${IFS}" ]]; then build_distros+=("kali:arm64" "kali:armhf" "kali:amd64"  "kali:i386"); fi
if [[ "$IFS${build_distros[*]}$IFS" =~ "${IFS}parrot${IFS}" ]]; then build_distros+=("parrot:arm64" "parrot:armhf" "parrot:amd64"  "parrot:i386"); fi
if [[ "$IFS${build_distros[*]}$IFS" =~ "${IFS}ubuntu${IFS}" ]]; then build_distros+=("ubuntu:arm64" "ubuntu:armhf" "ubuntu:amd64"  "ubuntu:i386"); fi

backbox_url=https://raw.githubusercontent.com/Radialbog9/PRootify/main/bootstrap-scripts/backbox.sh
debian_url=https://raw.githubusercontent.com/Radialbog9/PRootify/main/bootstrap-scripts/debian.sh
kali_url=https://raw.githubusercontent.com/Radialbog9/PRootify/main/bootstrap-scripts/kali.sh
parrot_url=https://raw.githubusercontent.com/Radialbog9/PRootify/main/bootstrap-scripts/parrot.sh
ubuntu_url=https://raw.githubusercontent.com/Radialbog9/PRootify/main/bootstrap-scripts/ubuntu.sh

mkdir -p $temp_dir/{backbox,debian,kali,parrot,ubuntu}

for (( c=0; c<${#build_distros[@]}; c++ ))
do
    distro="${build_distros[c]}"
    case "$distro" in
        backbox:arm64)
            bootstrapdist backbox arm64 $backbox_url $temp_dir
            ;;
        backbox:armhf)
            bootstrapdist backbox armhf $backbox_url $temp_dir
            ;;
        backbox:amd64)
            bootstrapdist backbox amd64 $backbox_url $temp_dir
            ;;
        backbox:i386)
            bootstrapdist backbox i386 $backbox_url $temp_dir
            ;;
        debian:arm64)
            bootstrapdist debian arm64 $debian_url $temp_dir
            ;;
        debian:armhf)
            bootstrapdist debian armhf $debian_url $temp_dir
            ;;
        debian:amd64)
            bootstrapdist debian amd64 $debian_url $temp_dir
            ;;
        debian:i386)
            bootstrapdist debian i386 $debian_url $temp_dir
            ;;
        kali:arm64)
            bootstrapdist kali arm64 $kali_url $temp_dir
            ;;
        kali:armhf)
            bootstrapdist kali armhf $kali_url $temp_dir
            ;;
        kali:amd64)
            bootstrapdist kali amd64 $kali_url $temp_dir
            ;;
        kali:i386)
            bootstrapdist kali i386 $kali_url $temp_dir
            ;;
        parrot:arm64)
            bootstrapdist parrot arm64 $parrot_url $temp_dir
            ;;
        parrot:armhf)
            bootstrapdist parrot armhf $parrot_url $temp_dir
            ;;
        parrot:amd64)
            bootstrapdist parrot amd64 $parrot_url $temp_dir
            ;;
        parrot:i386)
            bootstrapdist parrot i386 $parrot_url $temp_dir
            ;;
        ubuntu:arm64)
            bootstrapdist ubuntu arm64 $ubuntu_url $temp_dir
            ;;
        ubuntu:armhf)
            bootstrapdist ubuntu armhf $ubuntu_url $temp_dir
            ;;
        ubuntu:amd64)
            bootstrapdist ubuntu amd64 $ubuntu_url $temp_dir
            ;;
        ubuntu:i386)
            bootstrapdist ubuntu i386 $ubuntu_url $temp_dir
            ;;
        *)
            ;;
    esac
done

cp $temp_dir/{backbox,debian,kali,parrot,ubuntu}/*.tar.xz $output_dir

rm -rd $temp_dir/
