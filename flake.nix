{
  description = "NixOS multi-machine configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... }:
  let
    mkHost = { system ? "x86_64-linux", nixosModules, hmModules ? [ ] }:
    let
      pkgs-unstable = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };
    in
    nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit pkgs-unstable; };
      modules = nixosModules ++ [
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.aidenp = { imports = [ ./home/home.nix ] ++ hmModules; };
          home-manager.extraSpecialArgs = { inherit pkgs-unstable; };
        }
      ];
    };
  in
  {
    nixosConfigurations = {
      oak = mkHost {
        nixosModules = [ ./nixos/machines/oak/configuration.nix ];
      };
      # cedar = mkHost { nixosModules = [ ./nixos/machines/cedar/configuration.nix ]; };
      # willow = mkHost { nixosModules = [ ./nixos/machines/willow/configuration.nix ]; };
      # rowan = mkHost { nixosModules = [ ./nixos/machines/rowan/configuration.nix ]; };
    };
  };
}
