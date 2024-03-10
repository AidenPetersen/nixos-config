{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    vlc
    firefox
    libreoffice
    gimp
  ];
}
