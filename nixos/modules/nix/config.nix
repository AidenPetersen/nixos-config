{ config, pkgs, ... }:
{
  imports = [
    ./nixpkgs-config.nix
    ./garbage.nix
  ];
  
  nix = {
    settings.auto-optimise-store = true;
    settings.experimental-features = [ "nix-command" "flakes" ]; 
    settings.download-buffer-size = 524288000;
  };
}
