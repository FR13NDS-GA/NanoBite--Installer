#!/bin/bash

#!Install using NanoBite

# Install OSINT ~/Ghost Toolkit

echo "Installing Ghost Seeker Toolkit pkgs..."

# Variables for repository URL and target directory
REPO_URL="https://github.com/FR13NDS-GA/Ghost.git"
TARGET_DIR="$HOME/Documents"

# Check if target directory exists, if not, create it
if [ ! -d "$TARGET_DIR" ]; then
    echo "Directory does not exist. Creating directory $TARGET_DIR..."
    mkdir -p "$TARGET_DIR"
fi

# Navigate to the target directory
cd "$TARGET_DIR"

# Clone the GitHub repository into the specified directory
echo "Cloning the repository $REPO_URL into $TARGET_DIR..."
git clone "$REPO_URL"

# Output success message
echo "Repository cloned into $TARGET_DIR."


filename="Ghost_Exe.sh"
cat <<EOL > $filename
# Ghost cmd execution script

echo "Welcome to Ghost Seeker!"
echo ""
echo "The new OSINT tool for the pros"
echo ""
echo "Sophisticated, clean and complex"
echo ""
echo "To start Seeker, run this cmd: Ghost--Seeker"
echo ""
read cmdline

if [[ "\$cmdline" == "Ghost--Seeker" ]]; then
    clear
    python3 ~/Documents/Ghost/main.py
elif [[ "\$cmdline" == "Ghost" ]]; then
    clear
    echo "Welcome to Ghost Seeker!"
    echo ""
    echo "The new OSINT tool for the pros"
    echo ""
    echo "Sophisticated, clean and complex"
    echo ""
    echo "To start Seeker, run this cmd: Ghost--Seeker"
    echo ""
    read cmdline
elif [[ "\$cmdline" == "/q" ]]; then
    echo "Exiting..."
    clear
else
    echo "Error! Invalid Command!"
fi


EOL

# Move the script to /usr/local/bin
sudo mv Ghost_Exe.sh /usr/local/bin/Ghost

# Make the Ghost script executable
sudo chmod +x /usr/local/bin/Ghost

#! Installing libs/dependancies
# Install the required packages
echo "Installing whois..."
sudo apt install -y whois

echo "Installing Sherlock..."
sudo apt install -y sherlock

echo "Installing Nmap..."
sudo apt install -y nmap

echo "Installing Traceroute..."
sudo apt install -y traceroute

echo "Installing DNS utilities..."
sudo apt install -y dnsutils

#! Notify the user of completion

echo "Instillation Complete!"
echo "Ghost Seeker Toolkit is installed, Run it using this command: Ghost"

