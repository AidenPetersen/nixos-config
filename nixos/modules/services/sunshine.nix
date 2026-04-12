{ config, pkgs, ... }:
{
  services.sunshine = {
    enable = true;
    autoStart = true;
    capSysAdmin = true;  # required for KMS capture (Wayland/no desktop)
    openFirewall = true; # opens the required UDP/TCP ports automatically
  };
}

