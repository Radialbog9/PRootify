# ############################## #
# PRootify                       #
# by Radialbog9                  #
# License: GNU GPL3              #
# File: prootify.sh              #
# ############################## #

defaultmirror=https://files.rb9.xyz/prootify/
mirror=${PROOTIFY_MIRROR:-$defaultmirror}

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
		whiptail --backtitle PRootify --msgbox "Error: Couldn't determine your architecture. Cannot continue." 15 45
		exit 1
		;;
esac

while true
do
# Get action
action=$(whiptail --backtitle PRootify \
	--menu "Select Action" 15 40 5 \
	install "Install Distro" \
	modify "Add/Remove Features" \
	uninstall "Remove Distro" \
	mirror "Change Mirror" \
	3>&1 1>&2 2>&3)
exit_if_cancelled

# Get Distro
if [ $action != "mirror" ]; 
then
	if [ $arch == "i386" ];
	then
		# i386 distro list
		distro=$(whiptail --backtitle PRootify \
			--menu "Select Distro" 15 45 7 \
			alpine-mini "Alpine" \
			backbox "BackBox" \
			centos "CentOS" \
			debian "Debian" \
			kali "Kali" \
			nethunter "Kali Nethunter" \
			parrot "Parrot" \
			ubuntu "Ubuntu" \
			void "Void" \
			3>&1 1>&2 2>&3)
		exit_if_cancelled
	else
		# arm64, armhf, and amd64 distro list
		distro=$(whiptail --backtitle PRootify \
			--menu "Select Distro" 15 45 7 \
			alpine-mini "Alpine" \
			backbox "BackBox" \
			centos "CentOS" \
			debian "Debian" \
			fedora "Fedora" \
			kali "Kali" \
			nethunter "Kali Nethunter" \
			parrot "Parrot" \
			ubuntu "Ubuntu" \
			void "Void" \
			opensuse-leap "openSUSE Leap" \
			opensuse-tumbleweed "openSUSE Tumbleweed" \
			3>&1 1>&2 2>&3)
		exit_if_cancelled
	fi
fi

case $distro in
	alpine)
		archive_format=gz
		dist_path=\\/bin:\\/usr\\/bin:\\/sbin:\\/usr\\/sbin
		dist_shell="\\/bin\\/sh --login"
		;;
	void)
		archive_format=xz
		dist_path=\\/bin:\\/usr\\/bin:\\/sbin:\\/usr\\/sbin
		dist_shell="\\/bin\\/bash --login"
		;;
	*)
		archive_format=xz
		dist_path=\\/usr\\/local\\/sbin:\\/usr\\/local\\/bin:\\/bin:\\/usr\\/bin:\\/sbin:\\/usr\\/sbin:\\/usr\\/games:\\/usr\\/local\\/games
		dist_shell="\\/bin\\/bash --login"
		;;
esac

# Steps
case $action in
	install)
		# Select where to install
		dir=$(whiptail --backtitle PRootify \
			--inputbox "Select Installation Directory (default = current user home directory)" 15 45 \
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
		wget -O $dir/$distro-rootfs.tar.$archive_format "$mirror/rootfs/$distro-rootfs-$arch.tar.$archive_format"
		currentdir=`pwd`
		mkdir -p $dir/$distro-fs
		# goto folder where rootfs is
		cd "$dir/$distro-fs"
		echo "Decompressing RootFS..."
		if [ "$is_termux" == "yes" ];
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
		echo "Generating start script..."
		# Termux start script
		if [ "$is_termux" == yes ];
		then
			cat > $dir/start-$distro.sh <<- EOM
#!/bin/bash
cd \$(dirname \$0)
## unset LD_PRELOAD in case termux-exec is installed
unset LD_PRELOAD
command="proot"
command+=" --link2symlink"
command+=" -0"
command+=" -r *DIST*-fs/"
if [ -n "\$(ls -A *DIST*-binds)" ]; then
	for f in *DIST*-binds/* ;do
		. \$f
	done
fi
command+=" -b /dev"
command+=" -b /proc"
command+=" -b *DIST*-fs/root:/dev/shm"
## uncomment the following line to have access to the home directory of termux
#command+=" -b /data/data/com.termux/files/home:/root"
## uncomment the following line to mount /sdcard directly to / 
#command+=" -b /sdcard"
command+=" -w /root"
command+=" /usr/bin/env -i"
command+=" HOME=/root"
command+=" PATH=*PATH*"
command+=" TERM=\$TERM"
command+=" LANG=C.UTF-8"
command+=" *SHELL*"
com="\$@"
if [ -z "\$1" ];then
	exec \$command
else
	\$command -c "\$com"
fi
			EOM
		else
			cat > $dir/start-$distro.sh <<- EOM
#!/bin/bash
cd \$(dirname \$0)
command="proot"
command+=" -0"
command+=" -r *DIST*-fs/"
if [ -n "\$(ls -A *DIST*-binds)" ]; then
	for f in *DIST*-binds/* ;do
		. \$f
	done
fi
command+=" -b /dev"
command+=" -b /proc"
command+=" -b *DIST*-fs/root:/dev/shm"
## uncomment the following line to have access to the root home folder in /root
#command+=" -b /root:/root"
## uncomment the following line to have access to the your home folder in /root
#command+=" -b ~:/root"
command+=" -w /root"
command+=" /usr/bin/env -i"
command+=" HOME=/root"
command+=" PATH=*PATH*"
command+=" TERM=\$TERM"
command+=" LANG=C.UTF-8"
command+=" *SHELL*"
com="\$@"
if [ -z "\$1" ];then
	exec \$command
else
	\$command -c "\$com"
fi
			EOM
		fi
		sed -i "s/\*DIST\*/$distro/g" $dir/start-$distro.sh
		sed -i "s/\*PATH\*/$dist_path/g" $dir/start-$distro.sh
		sed -i "s/\*SHELL\*/$dist_shell/g" $dir/start-$distro.sh
		if [ "$is_termux" == yes ]; then termux-fix-shebang $dir/start-$distro.sh; fi
		echo "Making $dir/start-$distro.sh executable..."
		chmod +x $dir/start-$distro.sh
		echo "Removing $dir/$distro-rootfs.tar.$archive_format"
		rm $dir/$distro-rootfs.tar.$archive_format
		echo "Done!"
		echo "Run $dir/start-$distro.sh to drop into your new distro!"
		whiptail --backtitle PRootify --msgbox "Installation finished!" 15 40
		;;
	uninstall)
		# Select where it was installed
		dir=$(whiptail --backtitle PRootify \
			--inputbox "Select Installation Directory (default = current user home directory)" 15 45 \
			"$(realpath ~)" \
			3>&1 1>&2 2>&3)
		exit_if_cancelled
		if ! [ -d "$dir/$distro-fs/" ];
		then
			echo "File system directory doesn't exist! Can't continue."
			echo "If this system is somehow borked, manually remove the distro with this command:"
			echo "rm -rfd $dir/start-$distro.sh $dir/$distro-{fs,binds}/"
			exit 1
		fi
		echo "Installation directory: $dir"
		confirm=$(whiptail --backtitle PRootify \
			--yesno "Are you sure you want to remove directories for $distro ($dir/$distro-fs/, $dir/$distro-binds/, and $dir/start-$distro.sh)?" 15 40 \
			3>&1 1>&2 2>&3)
		exit_if_cancelled
		echo "Removing files..."
		rm -rfd $dir/start-$distro.sh $dir/$distro-{fs,binds}/
		echo "Done!"
		whiptail --backtitle PRootify --msgbox "Uninstallation finished!" 15 40
		;;
	mirror)
		newmirror=$(whiptail --backtitle PRootify \
			--inputbox "Type mirror here or leave blank/press cancel to keep current" 15 45 \
			"$mirror" \
			3>&1 1>&2 2>&3)
		if [ ! -e $newmirror ];
		then
			# Mirror selected
			mirror=$newmirror
		fi
		whiptail --backtitle PRootify --msgbox "Set mirror to $mirror." 15 40
		;;
	*)
		whiptail --backtitle PRootify --msgbox "This feature hasn't been implemented yet." 15 40
		;;
esac
done