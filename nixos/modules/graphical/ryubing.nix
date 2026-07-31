{ config, pkgs, pkgs-unstable, ... }:
{
  environment.systemPackages = [
    pkgs.ryubing
  ];
}
