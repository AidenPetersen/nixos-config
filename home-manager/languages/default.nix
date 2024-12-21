{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    # Python
    python3
  ];
}
