{config, pkgs, callPackage, ... }:
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

    pkgs.libvterm

    pkgs.binutils
    pkgs.imagemagick
    pkgs.fd
    pkgs.zstd
    pkgs.ccls
    pkgs.gnumake
    pkgs.cmake

    pkgs.ungoogled-chromium
  ];

  services.emacs.enable = true;

  programs.emacs = {
    enable = true;
    package = pkgs.emacs30;
    extraPackages = epkgs: [
      epkgs.vterm
    ];
  };
  

}
