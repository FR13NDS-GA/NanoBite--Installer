#!/bin/bash

# Check if script is run with at least one argument
if [ $# -eq 0 ]; then
    echo "No arguments provided. Please provide the necessary parameters."
    exit 1
fi

# Read and display the command-line arguments
echo "You ran this script with the following command-line arguments:"
for arg in "$@"; do
    echo "$arg"
done

# Example of further usage of command-line arguments
# This could be software installation, configuration, or any other task
echo "Installing software with the provided arguments..."

# Simulating software installation
echo "Installation complete!"

if [ $arg == "Ghost" ]; then
  chmod +x /usr/local/bin/NanoBite--Installer/pkgs/Ghost/NanoBite-get--install.sh
  ./usr/local/bin/NanoBite--Installer/pkgs/Ghost/NanoBite-get--install.sh
else
  echo "error! pkg does not exist"
fi

