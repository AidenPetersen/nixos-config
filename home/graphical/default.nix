{ config, pkgs, ... }:
{
  imports = [
  ];

  home.packages = [
    pkgs.vscode
   
    pkgs.vlc

    pkgs.gnome-tweaks
    pkgs.nerd-fonts._0xproto
    pkgs.nerd-fonts.droid-sans-mono

    pkgs.libvterm

    pkgs.binutils
    pkgs.imagemagick
    pkgs.fd
    pkgs.zstd
    pkgs.ccls
    pkgs.gnumake
    pkgs.cmake

    pkgs.emacs
    pkgs.obsidian
    pkgs.darktable
#    pkgs.ungoogled-chromium
  ];
}
