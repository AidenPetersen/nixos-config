{ pkgs, ... }:
{
  nixpkgs = {
    config = {
      allowUnfree = true; # allow proprietary software / drivers (required for nvidia drivers)
    };
  };
}
