{ config, pkgs, ... }:
{
  imports = [
    ./headless
    ./graphical
    ./languages
  ];
  nixpkgs.config.allowUnfree = true;

  programs.home-manager.enable = true;

  manual.manpages.enable = true;

  home = {
    username = "aidenp";
    homeDirectory = "/home/aidenp";
  };

  home.stateVersion = "25.11";
}
