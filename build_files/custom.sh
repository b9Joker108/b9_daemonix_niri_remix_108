#!/bin/bash

# custom name
sed -i 's/^NAME=.*/NAME="Fedora (Daemonix)"/' /etc/os-release
sed -i 's/^PRETTY_NAME=.*/PRETTY_NAME="Fedora (Daemonix)"/' /etc/os-release

# Icon theme
git clone https://github.com/DXC-0/Flatery.git
cd Flatery
bash install.sh
