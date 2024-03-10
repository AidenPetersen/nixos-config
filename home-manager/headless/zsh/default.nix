{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    pkgs.oh-my-zsh
  ];
  
  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "clean";
    };
  };
}
