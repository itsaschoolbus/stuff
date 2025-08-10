#!/bin/bash
set -e

if [ "$EUID" -eq 0 ]; then
  while true; do
    echo -n "Change root password? (Y/n): "
    read answer
    case "$answer" in
      [Yy]|"")
        passwd
        break
        ;;
      [Nn])
        echo "Skipping root password change."
        break
        ;;
      *)
        echo "Unknown answer."
        ;;
    esac
  done
fi

yes | sudo unminimize
sudo apt-get install -y bc bison build-essential ccache curl flex g++-multilib gcc-multilib git git-lfs gnupg gperf imagemagick lib32ncurses-dev lib32readline-dev lib32z1-dev liblz4-tool libncurses6 libncurses-dev libsdl1.2-dev libssl-dev libwxgtk3.2-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc zip zlib1g-dev byobu wget
curl https://raw.githubusercontent.com/itsaschoolbus/stuff/refs/heads/main/noble-python2.sh | bash
sudo useradd -m builder
sudo passwd builder
sudo chsh -s /bin/bash builder
echo "builder ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/builder
sudo runuser -l builder -c 'byobu-enable'
