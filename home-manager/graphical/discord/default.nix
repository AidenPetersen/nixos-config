{ config, pkgs, ... }:
let
  unstable = import <nixpkgs> { config = { allowUnfree = true; }; };
in
{
  nixpkgs.overlays = [
    (self: super: {
      discord = unstable.discord.override {
        nss = pkgs.nss_latest;
      };
    })
  ];
  home.packages = with pkgs; [ discord ];
}
