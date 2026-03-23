{ config, pkgs, ... }:
{
  imports = [
    ./headless
    ./graphical
    ./languages
  ];
  programs.home-manager.enable = true;

  manual.manpages.enable = true;

  home = {
    username = "aidenp";
    homeDirectory = "/home/aidenp";
  };

  home.stateVersion = "25.05";
}
