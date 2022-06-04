{ config, pkgs, ... }:
{
  imports = [
    ./nixpkgs-config.nix
    ./garbage.nix
  ];
  
  nix = {
    autoOptimiseStore = true;
    
    # Enable nix flakes
    extraOptions = ''
    experimental-features = nix-command flakes
    '';
  };
}
