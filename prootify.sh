# ############################## #
# PRootify                       #
# by Radialbog9                  #
# License: GNU GPL3              #
# File: prootify.sh              #
# ############################## #

function exit_if_cancelled () {
	if [ $? == 1 ]
	then
		echo "Quit."
		exit 1
	fi
}

function check_dependencies () {
	for var in "$@"; do
		command -v $var >/dev/null 2>&1 || { echo >&2 "I require $var but it isn't installed! Aborting!"; exit 1; }
	done
}

# Check dependencies
check_dependencies wget whiptail proot

is_termux=no
if [ -x "/data/data/com.termux/files/usr/bin/termux-fix-shebang" ];
then
	is_termux=yes
fi


# Get architecture
use_dpkg=true
command -v dpkg >/dev/null 2>&1 || { use_dpkg=false; }

if [ $use_dpkg == "true" ]
then
	# use dpkg if present
	arch_reported=`dpkg --print-architecture`
else
	# use arch as a fallback
	arch_reported=`arch`
fi

case "$arch_reported" in
	aarch64 | arm64)
		arch="arm64" ;;
	arm | armhf)
		arch="armhf" ;;
	amd64 | x86_64)
		arch="amd64" ;;
	i*86 | x86)
		arch="i386" ;;
	*)
		whiptail --backtitle PRootify --msgbox "Error: Couldn't determine your architecture. Cannot continue." 15 40
		exit 1
		;;
esac

# Get action
action=$(whiptail --backtitle PRootify \
	--menu "Select Action" 15 40 5 \
	install "Install Distro" \
	modify "Add/Remove Features" \
	uninstall "Remove Distro" \
	3>&1 1>&2 2>&3)
exit_if_cancelled

# Get Distro
if [ $arch == "i386" ];
then
	# i386 distro list
	distro=$(whiptail --backtitle PRootify \
		--menu "Select Distro" 15 40 7 \
		alpine "Alpine" \
		backbox "BackBox" \
		centos "CentOS" \
		debian "Debian" \
		kali "Kali" \
		nethunter "Kali Nethunter Full" \
		parrot "Parrot" \
		ubuntu "Ubuntu" \
		void "Void" \
		3>&1 1>&2 2>&3)
	exit_if_cancelled
else
	# arm64, armhf, and amd64 distro list
	distro=$(whiptail --backtitle PRootify \
		--menu "Select Distro" 15 40 7 \
		alpine "Alpine" \
		backbox "BackBox" \
		centos "CentOS" \
		debian "Debian" \
		fedora "Fedora" \
		kali "Kali" \
		nethunter "Kali Nethunter Full" \
		parrot "Parrot" \
		ubuntu "Ubuntu" \
		void "Void" \
		opensuse-leap "openSUSE Leap" \
		opensuse-tumbleweed "openSUSE Tumbleweed" \
		3>&1 1>&2 2>&3)
	exit_if_cancelled
fi

case $distro in
	alpine)
		archive_format=gz
		dist_path="/bin:/usr/bin:/sbin:/usr/sbin"
		dist_shell="/bin/sh --login"
		;;
	backbox)
		archive_format=xz
		dist_path="/usr/local/sbin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/games:/usr/local/games"
		dist_shell="/bin/bash --login"
	centos)
		archive_format=xz
		dist_path="/usr/local/sbin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/games:/usr/local/games"
		dist_shell="/bin/bash --login"
	*)
		archive_format=xz
		;;
esac

# Steps
case $action in
	install)
		# Select where to install
		dir=$(whiptail --backtitle PRootify \
			--inputbox "Select Installation Directory (default = current user home directory)" 15 40 \
			"$(realpath ~)" \
			3>&1 1>&2 2>&3)
		exit_if_cancelled
		echo "Installation directory: $dir"
		confirm=$(whiptail --backtitle PRootify \
			--yesno "Are you sure you want to install $distro into $dir/$distro-fs and $dir/$distro-binds with launch script $dir/start-$distro.sh?" 15 40 \
			3>&1 1>&2 2>&3)
		exit_if_cancelled
		# Start installation
		echo "Downloading Archive..."
		wget -O $dir/$distro-rootfs.tar.$archive_format "https://files.rb9.xyz/prootify/rootfs/$distro-rootfs-$arch.tar.$archive_format"
		currentdir=`pwd`
		mkdir -p $dir/$distro-fs
		# goto folder where rootfs is
		cd "$dir/$distro-fs"
		echo "Decompressing RootFS..."
		if [ "$is_termux" == "yes" ]
		then
			proot --link2symlink tar -xJf $dir/$distro-rootfs.tar.$archive_format
		else
			proot tar -xJf $dir/$distro-rootfs.tar.$archive_format
		fi
		rm -rfd dev/
		echo "Setting up networking..."
		echo "127.0.0.1 localhost" > etc/hosts
    	echo "nameserver 1.1.1.1" > etc/resolv.conf
    	echo "nameserver 1.0.0.2" >> etc/resolv.conf
		# cd back to where we were before
		cd "$currentdir"
		mkdir -p $dir/$distro-binds
		# todo do something
		;;
	*)
		whiptail --backtitle PRootify --msgbox "This feature hasn't been implemented yet." 15 40
		exit 1
		;;
esac