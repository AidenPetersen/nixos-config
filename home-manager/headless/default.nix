{ config, pkgs, ... }:
{
  imports = [
    ./git.nix
    ./fish.nix
  ];
  home.packages = [
    pkgs.htop
  ];
}
