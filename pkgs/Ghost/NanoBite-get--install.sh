#!/bin/bash

# Install OSINT ~/Ghost Toolkit using NanoBite

echo "Installing Ghost Seeker Toolkit pkgs..."

# Variables for repository URL and target directory
REPO_URL="https://github.com/FR13NDS-GA/Ghost.git"
TARGET_DIR="/home/kali/Documents"

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

# Fix permissions for the cloned repository to avoid permission errors
echo "Setting permissions for $TARGET_DIR/Ghost..."
chmod -R 755 "$TARGET_DIR/Ghost"

# Output success message
echo "Repository cloned into $TARGET_DIR."

# Create the Ghost_Exe.sh script
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
    sudo python3 /home/kali/Documents/Ghost/main.py
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

# Move the script to /usr/local/bin for system-wide access
sudo mv Ghost_Exe.sh /usr/local/bin/Ghost

# Make the Ghost script executable
sudo chmod +x /usr/local/bin/Ghost

# Install required packages
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

sudo chmod +x /home/kali/Documents/Ghost/email_info.sh

# Notify the user of completion
echo "Installation Complete!"
echo "Ghost Seeker Toolkit is installed. Run it using the command: Ghost"
