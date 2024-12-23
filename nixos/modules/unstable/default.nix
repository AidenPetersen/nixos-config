{ config, pkgs, ... }:
let
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
in {
  environment.systemPackages = [
    unstable.thunderbird
    unstable.btop
  ];
}
