{ config, pkgs, ... }:
{
  services.sunshine = {
    enable = true;
    autoStart = true;
    capSysAdmin = true;  # required for KMS capture (Wayland/no desktop)
    openFirewall = true; # opens the required UDP/TCP ports automatically
  };
  networking.firewall = {
    allowedTCPPorts = [ 47984 47989 47990 48010 ];
    allowedUDPPorts = [ 47998 47999 48000 48002 48010 ];
  };
}

