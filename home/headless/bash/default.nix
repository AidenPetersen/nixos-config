{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    pkgs.oh-my-zsh
    pkgs.xorg.xhost
  ];
  
  programs.bash = {
    enable = true;
    shellAliases = {
    vi = "nvim";
  };
  initExtra = 
    "eval \"$(direnv hook bash)\"";
  };
}
