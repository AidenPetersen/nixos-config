{ config, pkgs, lib, ... }:
{
  nixpkgs = {
    config = {
      allowUnfree = true; # allow proprietary software / drivers (required for nvidia drivers)
      # Not building :(
      permittedInsecurePackages = [
        "python2.7-pyjwt-1.7.1"
      ];
    };
  };
}
