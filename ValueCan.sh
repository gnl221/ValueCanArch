#! /bin/bash

sudo pacman -S linux-headers base-devel git libusb libpcap
git clone https://github.com/intrepidcs/intrepid-socketcan-kernel-module.git
cd intrepid-socketcan-kernel-module
make
make reload
sudo make install
cd ~
git clone --recursive https://github.com/intrepidcs/icsscand.git
cd icsscand
mkdir build && cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
make
libicsneo-socketcan-daemon
sudo ./libicsneo-socketcan-daemon -d
sleep 3
sudo ip link set up can0
sudo ip link set up can1



