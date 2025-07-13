#!/bin/bash

unminimize
sudo apt-get install -y bc bison build-essential ccache curl flex g++-multilib gcc-multilib git git-lfs gnupg gperf imagemagick lib32ncurses-dev lib32readline-dev lib32z1-dev liblz4-tool libncurses6 libncurses-dev libsdl1.2-dev libssl-dev libwxgtk3.2-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc zip zlib1g-dev byobu zsh wget
curl https://raw.githubusercontent.com/itsaschoolbus/stuff/refs/heads/main/noble-python2.sh | bash
useradd -m builder
passwd builder
passwd
chsh builder -s /bin/zsh
echo "builder ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/custom
runuser -l builder -c 'byobu-enable'
