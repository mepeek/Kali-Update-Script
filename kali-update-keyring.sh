#!/bin/bash

# Update the Kali keyring
echo "Downloading the latest Kali keyring..."
wget https://http.kali.org/kali/pool/main/k/kali-archive-keyring/kali-archive-keyring_2023.1_all.deb -O /tmp/kali-archive-keyring.deb

echo "Installing the Kali keyring..."
sudo dpkg -i /tmp/kali-archive-keyring.deb

# Update the sources list
echo "Updating sources list..."
echo "deb http://http.kali.org/kali kali-rolling main non-free contrib" | sudo tee /etc/apt/sources.list

# Perform update and upgrade
echo "Updating package lists and upgrading the system..."
sudo apt update && sudo apt full-upgrade -y

# Clean up
echo "Cleaning up unnecessary packages..."
sudo apt autoremove -y
sudo apt clean

echo "System update complete!"
