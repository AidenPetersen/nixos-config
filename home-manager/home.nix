{ config, pkgs, ... }:
let
  config = import ./user-config.nix;
in {
  imports = [
    ./headless
    ./graphical
    ./languages
  ];
  nixpkgs.config.allowUnfree = true;
  
  programs.home-manager.enable = true;

  manual.manpages.enable = true;

  # User info
  home = {
    username = "aidenp";
    homeDirectory = "/home/aidenp";
  };

  home.stateVersion = "24.05";
}
