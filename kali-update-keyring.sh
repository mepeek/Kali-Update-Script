#!/bin/bash

# Update the Kali keyring
echo "Downloading the latest Kali keyring..."
wget https://archive.kali.org/archive-keyring/kali-archive-keyring.gpg -O /tmp/kali-archive-keyring.gpg

echo "Installing the Kali keyring..."
sudo cp /tmp/kali-archive-keyring.gpg /etc/apt/trusted.gpg.d/

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
