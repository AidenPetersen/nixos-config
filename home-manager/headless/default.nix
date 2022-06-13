{ config, pkgs, ... }:
{
  imports = [
    ./git
    ./fish
    ./neovim
  ];
  home.packages = with pkgs; [
    htop
    fzf
  ];
}
