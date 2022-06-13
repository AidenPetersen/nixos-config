{ config, pkgs, ... }:
{
  programs.fish.enable = true;
  programs.fish.interactiveShellInit = builtins.readFile ./fishrc;
    programs.fish.shellAliases = {
      # vi = "nvim";
    };
}