{ config, pkgs, ... }:
let 
  groups = import ./groups.nix;
in {
  users.users.aidenp = {
    isNormalUser = true;
    home = "/home/aidenp";
    description = "Aiden Petersen";
    extraGroups = groups.adminGroups ++ groups.desktopGroups;
  };
}
