{ config, pkgs, ... }:
{
  imports = [
    ./aidenp.nix
  ];
  users.enforceIdUniqueness = true;
}
