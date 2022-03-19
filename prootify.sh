# ############################## #
# PRootify                       #
# by Radialbog9                  #
# License: GNU GPL3              #
# File: prootify.sh version 1.0  #
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
check_dependencies dpkg wget proot

is_termux=no
if [ pwd == "/data/data/com.termux/files/usr/bin/termux-fix-shebang" ]
then
	is_termux=yes
fi

echo $is_termux

# Get action
action=$(whiptail --backtitle PRootify \
	--menu "Select Action" 15 40 5 \
	install "Install Distro" \
	modify "Add/Remove Features" \
	uninstall "Remove Distro" \
	3>&1 1>&2 2>&3)
exit_if_cancelled

# Get Distro
distro=$(whiptail --backtitle PRootify \
	--menu "Select Distro" 15 40 7 \
	alpine "Alpine" \
	arch "Arch Linux" \
	backbox "BackBox" \
	centos "CentOS" \
	debian "Debian" \
	fedora "Fedora" \
	kali "Kali" \
	nethunter "Nethunter" \
	parrot "Parrot" \
	ubuntu "Ubuntu" \
	void "Void" \
	opensuse "openSUSE" \
	3>&1 1>&2 2>&3)
exit_if_cancelled

# Steps
case $action in
	install)
		# Get architecture
		case `dpkg --print-architecture` in
		esac
esac