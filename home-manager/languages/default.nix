{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    # JS :(
    deno
    nodejs

    # C
    gcc
    ccls

    # Rust
    rustup

    # Python
    python3
  ];
}
