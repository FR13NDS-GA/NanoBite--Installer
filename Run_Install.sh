if [ -z "$1" ]; then
  echo "Usage: $0 <cmdline>"
  exit 1
fi

cmdline=$1

if [ $cmdline == "NanoBite-get--install__Ghost" ]; then
  chmod +x ~/Documents/NanoBite--Installer/pkgs/Ghost/NanoBite-get--install.sh
  ./~/Documents/NanoBite--Installer/pkgs/Ghost/NanoBite-get--install.sh
else
  echo "error! pkg does not exist"
fi

