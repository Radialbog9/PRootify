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
if [ -x "/data/data/com.termux/files/usr/bin/termux-fix-shebang" ]
then
	is_termux=yes
fi


# Get architecture
case `dpkg --print-architecture` in
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
if [ $arch == "i386" ]
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
	opensuseleap "openSUSE Leap" \
	opensusetumbleweed "openSUSE Tumbleweed" \
	3>&1 1>&2 2>&3)
exit_if_cancelled
fi


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
		;;
	*)
		whiptail --backtitle PRootify --msgbox "This feature hasn't been implemented yet." 15 40
		exit 1
		;;
esac