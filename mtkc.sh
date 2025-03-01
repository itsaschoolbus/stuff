#!/bin/bash

# Create virtual environment
python3 -m venv ~/.venv || { echo "Error creating virtual environment"; exit 1; }

# Clone repository
git clone https://github.com/bkerler/mtkclient || { echo "Error cloning repository"; exit 1; }

# Change directory and activate
cd mtkclient || { echo "Error changing directory"; exit 1; }
. ~/.venv/bin/activate || { echo "Error activating virtual environment"; exit 1; }

# Install dependencies
pip install -r requirements.txt || { echo "Error installing requirements"; exit 1; }
pip install . || { echo "Error installing package"; exit 1; }

# Add user to groups
sudo groupadd plugdev
sudo groupadd dialout
sudo usermod -a -G plugdev,dialout $USER || { echo "Error adding user to groups"; exit 1; }

# Install udev rules
sudo cp mtkclient/Setup/Linux/*.rules /etc/udev/rules.d || { echo "Error copying udev rules"; exit 1; }

# Trigger udev
sudo udevadm control -R || { echo "Error running udevadm control"; exit 1; }
sudo udevadm trigger || { echo "Error running udevadm trigger"; exit 1; }

# venv
curl -o mtk_gui.sh https://raw.githubusercontent.com/itsaschoolbus/stuff/refs/heads/main/mtk_gui.sh
curl -o mtk.sh https://raw.githubusercontent.com/itsaschoolbus/stuff/refs/heads/main/mtk.sh
chmod +x mtk.sh
chmod +x mtk_gui.sh
clear
echo ""
echo "##IMPORTANT##"
echo ""
echo "Use mtk.sh/mtk_gui.sh!"
sleep 10

# Reboot?
read -p "Do you want to reboot? (its fucking needed) (y/n): " answer
if [[ "$answer" == "y" ]]; then
  reboot
fi
