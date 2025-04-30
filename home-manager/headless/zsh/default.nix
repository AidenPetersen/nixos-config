{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    pkgs.oh-my-zsh
    pkgs.xorg.xhost
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
  initExtra = 
    # for direnv
    "eval \"$(direnv hook zsh)\"";
    # for vivado
#    "xhost +si:localuser:$USER > /dev/null" + "\n" +
#    "source ~/Xilinx/Vivado/2023.2/settings64.sh";
  };
}
