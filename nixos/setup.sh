#!/bin/sh

# colors
reset=$(tput sgr0)
yellow=$(tput setaf 3)
green=$(tput setaf 2)
red=$(tput setaf 1)
bold=$(tput bold)

if [ $(id -u) -ne 0 ]; then
  echo -e "${red}${bold}ERROR:${reset} Invalid permissions. You must be root to run this command.";
  exit 1
fi

MACHINES=$(ls machines 2>/dev/null || echo "")
NUM_MACHINES=$(echo "$MACHINES" | wc -w)
if [ $NUM_MACHINES -lt 1 ]; then
  echo -e "${red}${bold}ERROR:${reset} Cannot find any machine configurations to install. You are probably in the incorrect directory."
  exit 1
fi

echo -e "${yellow}${bold}WARNING:${reset} This script will move all of the contents of /etc/nixos/ to /etc/nixos/.backup-<datetime>"
PS3="Select the machine to install: "
select machine in $MACHINES
do
  echo "chosen: $machine"
  # Backup config
  backup_dir="/etc/nixos/.backup-$(date +"%Y%m%d%H%M%S")"
  rm -rf $backup_dir
  mkdir -p $backup_dir
  mv /etc/nixos/* $backup_dir 

  # Repopulate config
  cp -r * /etc/nixos/
  ln -s /etc/nixos/machines/$machine/configuration.nix /etc/nixos/configuration.nix
  break
done

echo -e "${green}${bold}COMPLETE:${reset} The new configuration has been moved over. Run
  \e[3mnixos-rebuild switch${reset}
to change over the configuration."
exit 0
