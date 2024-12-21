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
  shellAliases = {
    vi = "nvim";
  };
  # for direnv
  initExtra = "eval \"$(direnv hook zsh)\"";
  };
}
