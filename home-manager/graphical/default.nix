{ config, pkgs, ... }:
{
  imports = [
    ./theming
    ./alacritty
  ];

  home.packages = [
    pkgs.vscode

    pkgs.vlc
    pkgs.discord

    pkgs.gnome3.gnome-tweaks
    pkgs.nerdfonts
  ];
}
