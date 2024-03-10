{ config, pkgs, ... }:
{
  # Change per machine
  imports = [
    ./machines/nixbox/configuration.nix
  ];
}
