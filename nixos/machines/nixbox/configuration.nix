# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [ 
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
      
      # Add users
      ../../modules/users/users.nix
      
      # Nvidia drivers
      # ../../modules/hardware/nvidia.nix
      
      # AMD drivers
      ../../modules/hardware/amd.nix
	
 
      # Desktop and Gnome stuff
      ../../modules/graphical/desktop.nix
      ../../modules/graphical/packages.nix
      
      # Headless programs
      ../../modules/headless/packages.nix

      # Select unstable programs
      ../../modules/unstable
      
      # Services
      ../../modules/services/docker.nix
      ../../modules/services/flatpak.nix
      ../../modules/services/mullvad.nix
      # ../../modules/services/syncthing.nix
      # ../../modules/services/ssh.nix
      
      # Nix config
      ../../modules/nix/config.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking
  networking.networkmanager.enable = true; # Enable network manager
  networking.hostName = "nixbox"; # Define your hostname.

  # Set your time zone.
  time.timeZone = "America/Chicago";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.utf8";

  # Keep up to date
  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leavecatenate(variables, "bootdev", bootdev)
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
