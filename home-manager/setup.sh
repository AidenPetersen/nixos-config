#!/bin/sh

# colors
reset=$(tput sgr0)
yellow=$(tput setaf 3)
green=$(tput setaf 2)
red=$(tput setaf 1)
bold=$(tput bold)

echo -e "${yellow}${bold}WARNING:${reset} This script will move all of the contents of ~/.config/nixpkgs to /.config/nixpkgs/.backup-<datetime>"

read -r -p "Are you sure? [Y/n] " input

case $input in
  [yY][eE][sS]|[yY]|"")
    # backup config
    mkdir -p $HOME/.config/nixpkgs
    backup_dir="$HOME/.config/nixpkgs/.backup-$(date +"%Y%m%d%H%M%S")"
    rm -rf $backup_dir
    mkdir -p $backup_dir
    mv $HOME/.config/nixpkgs/* $backup_dir 2>/dev/null

    # Repopulate config
    cp -r * $HOME/.config/nixpkgs
    ;;
  [nN][oO]|[nN])
    exit 0
    ;;
  *)
    echo "Invalid input"
    exit 1
    ;;
esac

echo -e "${green}${bold}COMPLETE:${reset} The new configuration has been moved over. Run
  \e[3mhome-manager switch${reset}
to change over the configuration."
exit 0
