{ config, pkgs, ... }:
let 
  adw-gtk3 = pkgs.callPackage ../nix/pkgs/adw-gtk3 { };
in {
  environment.systemPackages = [
    adw-gtk3
  ];
}
