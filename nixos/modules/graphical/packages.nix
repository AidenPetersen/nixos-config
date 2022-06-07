{ config, pkgs, ... }:
{
  imports = [
    ./steam.nix
  ];

  environment.systemPackages = with pkgs; [
    vlc
    firefox
    libreoffice
    inkscape
    krita
    gimp
  ];
}
