# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix

      # NAS modules
      ../../modules/nas/disks.nix
      ../../modules/nas/services.nix
      ../../modules/nas/wireguard.nix
      ../../modules/nas/networking.nix
      ../../modules/nas/fail2ban.nix
      ../../modules/nas/caddy.nix
      ../../modules/nas/glance.nix
      ../../modules/nas/nfs.nix

      ../../modules/hardware/intel_gpu.nix

      # Shared modules
      ../../modules/nix/config.nix
      ../../modules/users/users.nix
      ../../modules/headless/packages.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "cedar";
  networking.networkmanager.enable = true;

  time.timeZone = "America/Chicago";
  services.xserver.xkb.layout = "us";

  # NAS-specific packages (CLI utils already provided by headless/packages.nix)
  environment.systemPackages = with pkgs; [
    btrfs-progs
    inetutils
    nettools
    python3
    go
    nss
    recyclarr
  ];

  networking.tempAddresses = "disabled";

  services.openssh.enable = true;

  system.stateVersion = "25.11";
}
