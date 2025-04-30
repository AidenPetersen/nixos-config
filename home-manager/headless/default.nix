{ config, pkgs, ... }:
{
  imports = [
    ./git
    ./zsh
  ];
  home.packages = with pkgs; [
    htop
    fzf
    tmux
    neovim
    stow
    ripgrep
    fd
    zip
    unzip

    # Needed to build vterm 
    gcc
    libtool
  ];
}
