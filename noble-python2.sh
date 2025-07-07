#!/bin/bash

mkdir -p ~/python2-jammy && cd ~/python2-jammy
wget http://security.ubuntu.com/ubuntu/pool/universe/p/python2.7/python2.7_2.7.18-13ubuntu1.5_amd64.deb
wget http://security.ubuntu.com/ubuntu/pool/universe/p/python2.7/libpython2.7-stdlib_2.7.18-13ubuntu1.5_amd64.deb
wget http://security.ubuntu.com/ubuntu/pool/universe/p/python2.7/python2.7-minimal_2.7.18-13ubuntu1.5_amd64.deb
wget http://security.ubuntu.com/ubuntu/pool/universe/p/python2.7/libpython2.7-minimal_2.7.18-13ubuntu1.5_amd64.deb
sudo apt install libnsl2 -y
sudo dpkg -i libpython2.7-minimal_*.deb
sudo dpkg -i python2.7-minimal_*.deb
sudo dpkg -i libpython2.7-stdlib_*.deb
sudo dpkg -i python2.7_*.deb
sudo apt --fix-broken install
sudo ln -s /usr/bin/python2.7 /usr/local/bin/python2
