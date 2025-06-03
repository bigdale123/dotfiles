#!/bin/bash

# Install bare necessities
sudo sed -i '/^\[extra\]/,/Include/ s/^#//' /etc/pacman.conf
sudo pacman -Syu --noconfirm
sudo pacman -Sy --noconfirm base-devel git curl wget

# Install AUR Helper (yay)
git clone https://aur.archlinux.org/yay-bin.git ~/yay-bin
cd ~/yay-bin && makepkg -si --noconfirm
cd ~ && rm -rf ~/yay-bin

# installing packages available in Arch Pkg Repo
sudo pacman -Sy --noconfirm\
	gimp\
	github-cli\
	btop\
	audacity\
	obsidian\
	peek\
	fastfetch\
	prusa-slicer\
	vlc\
	rtl-sdr\
	inkscape\
	scribus\
	cool-retro-term\
	python\
	rustup\
	make\
	gcc\
	gdb\
	tailscale\
	tesseract\
	imagemagick\
	xsel\
	maim\
	xclip\
	mesa\
	lxappearance\
	libnotify\
	usbutils\
	zip\
	unzip\
	tar\
	qpdf\
	neovim\
	pciutils\
	linux-firmware\
	virt-viewer\
	darktable\
	mpv\
	vagrant
# installing AUR packages
yay -Sy\
	moonlight-qt\
	seafile-client\
	zoom\
	spotify\
	anki-bin\
	revanced-cli-bin\
	visual-studio-code-bin\
	cbonsai\
	gnucobol

