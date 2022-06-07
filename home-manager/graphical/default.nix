{ config, pkgs, ... }:
{
  home.packages = [
    pkgs.vscode

    pkgs.discord
    pkgs.vlc
    
    pkgs.gnome3.gnome-tweaks
  ];
}
