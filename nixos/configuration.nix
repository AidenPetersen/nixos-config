{ config, pkgs, ... }:
{
  # Change per machine
  imports = [
    ./machines/oak/configuration.nix
  ];
}
