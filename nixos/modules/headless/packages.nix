{ config, pkgs, ... }:
{
  imports = [
    ./home-manager.nix
  ];

  environment.systemPackages = with pkgs; [
    # Shell utilities
    moreutils
    binutils
    file
    psmisc
    netcat
    curl
    wget
    tree

    # admin utils
    lsb-release
    pciutils
    iputils
    powertop
    
    # Dev environment
    lorri
    direnv
    patchutils
    nix-index
    git
    
    # Fancy stuff
    zsh
    man-pages
    jq
    ripgrep
    fd
    exa
    bat
    neovim
    
    # Might use it someday
    nixops
  ];
}
