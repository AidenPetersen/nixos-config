{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    vlc
    firefox
    libreoffice
    inkscape
    krita
    gimp
  ];
}
