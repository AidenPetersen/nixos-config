# nixos-config

NixOS flake managing multiple machines. Home Manager is integrated as a NixOS module.

## Usage

Rebuild the current machine (e.g. oak):

```bash
sudo nixos-rebuild switch --flake .#oak
```

Or use the helper script:

```bash
./switch.sh
```

## Adding a new machine

1. Create `nixos/machines/<name>/configuration.nix` and `hardware-configuration.nix`
2. Add an entry to `nixosConfigurations` in `flake.nix`:
   ```nix
   <name> = mkHost { nixosModules = [ ./nixos/machines/<name>/configuration.nix ]; };
   ```

## Structure

```
├── flake.nix              # Entry point, inputs, mkHost helper
├── switch.sh              # Rebuild shortcut
├── home/                  # Home Manager config (user-level packages, dotfiles)
│   ├── home.nix
│   ├── graphical/
│   ├── headless/
│   └── languages/
└── nixos/                 # NixOS system config
    ├── machines/          # Per-machine configs + hardware
    │   └── oak/
    └── modules/           # Shared NixOS modules
        ├── graphical/
        ├── hardware/
        ├── headless/
        ├── nix/
        ├── services/
        └── users/
```
