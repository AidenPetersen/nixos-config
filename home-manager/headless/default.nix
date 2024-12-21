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
    distrobox
    ripgrep
    fd
  ];
}
