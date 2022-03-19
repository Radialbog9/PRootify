action=$(whiptail --backtitle PRootify \
	--menu "Select Step" 20 25 25 \
	install "Install Distro" \
	modify "Add/Remove Features" \
	uninstall "Remove Distro" \
	3>&1 1>&2 2>&3)
if [ $? == 1 ]
then
	echo "Cancelled"
	exit
fi

distro=$(whiptail --backtitle PRootify \
	--menu "Select Distro" 20 25 25 \
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
if [ $? == 1 ]
then
	echo "Cancelled"
	exit
fi

echo Selected Distro: $distro
