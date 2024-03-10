{ config, pkgs, ... }:
let 
  groups = import ./groups.nix;
in {
  programs.zsh.enable = true;
  users.users.aidenp = {
    isNormalUser = true;
    home = "/home/aidenp";
    description = "Aiden Petersen";
    extraGroups = groups.adminGroups ++ groups.desktopGroups;
    shell = pkgs.zsh;
  };
}
