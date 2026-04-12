{ config, pkgs, ... }:

{
  imports = [
      ./hardware-configuration.nix

      # Users
      ../../modules/users/users.nix

      # Desktop and Gnome
      ../../modules/graphical/desktop.nix
      ../../modules/graphical/packages.nix
      ../../modules/graphical/moonlight.nix

      # Headless programs
      ../../modules/headless/packages.nix

      # Unstable packages
      ../../modules/unstable

      # Services
      ../../modules/services/docker.nix
      ../../modules/services/flatpak.nix
      ../../modules/services/mullvad.nix
      ../../modules/services/tailscale.nix

      # Nix config
      ../../modules/nix/config.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.networkmanager.enable = true;
  networking.hostName = "willow";

  time.timeZone = "America/Chicago";
  i18n.defaultLocale = "en_US.UTF-8";

  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = false;

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
  ];

  system.stateVersion = "25.11";
}
