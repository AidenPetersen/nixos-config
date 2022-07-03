{ config, pkgs, ... }:
let
  unstable = import <nixpkgs> { config = { allowUnfree = true; }; };
in {
  environment.systemPackages = [
    unstable.thunderbird
  ];
}