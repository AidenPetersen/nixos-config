{ config, lib, pkgs, ... }:
{
  services.xserver.libinput = {
    enable = true;
  };
}
