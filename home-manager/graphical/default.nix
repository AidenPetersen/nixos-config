{config, pkgs, callPackage, ... }:
let
  unstable = import <nixpkgs> { config = { allowUnfree = true; }; };
in {
  imports = [
  ];

  # Emacs gcc
  services.emacs.package = pkgs.emacs-unstable;
  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/emacs-overlay/archive/master.tar.gz;
    }))
  ];

  #services.emacs.enable = true;

  home.packages = [
    pkgs.vscode
   
    pkgs.vlc

    pkgs.gnome3.gnome-tweaks
    pkgs.nerdfonts
    pkgs.emacs-git

    # doom emacs
    pkgs.binutils
    pkgs.imagemagick
    pkgs.fd
    pkgs.zstd
    pkgs.ccls
    pkgs.gnumake
    pkgs.cmake
    unstable.zed-editor
#    (pkgs.emacsWithPackagesFromUsePackage {
#      config = ~/.config/emacs/early-init.el;
#      defaultInitFile = true;
#      extraEmacsPackages = epkgs: [ epkgs.vterm ];
#      package = pkgs.emacs-git;
#    })
  ];

}
