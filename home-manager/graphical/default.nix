{ config, pkgs, ... }:
let
  unstable = import <nixpkgs> { config = { allowUnfree = true; }; };
in {
  imports = [
  ];

  home.packages = [
    pkgs.vscode

    pkgs.vlc

    pkgs.gnome3.gnome-tweaks
    pkgs.nerdfonts
  ];
}
