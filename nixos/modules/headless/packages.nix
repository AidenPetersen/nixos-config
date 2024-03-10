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
    nano
    vim

    # admin utils
    lsb-release
    pciutils
    iputils
    powertop
    
    # Dev environment
    direnv
    nix-direnv
    patchutils
    nix-index
    git
    
    # Fancy stuff
    zsh
    man-pages
    jq
    ripgrep
    fd
    eza
    bat
    neovim
    fzf
  ];
}
