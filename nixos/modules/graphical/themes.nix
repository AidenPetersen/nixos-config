{ config, pkgs, ... }:
let 
  adw-gtk3 = pkgs.callPackage ../packages/adw-gtk3 { };
in {
  #environment.systemPackages = [
  #  adw-gtk3
  #];
}
