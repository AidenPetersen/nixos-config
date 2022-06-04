{ config, pkgs, ... }:
{
  imports = [
    ./opengl.nix
  ];
  services.xserver.videoDrivers = [ "nvidia" ];
}
