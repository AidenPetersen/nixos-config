{ config, pkgs, pkgs-unstable, ... }:
{
  environment.systemPackages = [
    pkgs-unstable.thunderbird
    pkgs-unstable.btop
  ];
}
