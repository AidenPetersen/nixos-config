{ config, pkgs, ... }:
{
  # firewall rules
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [
      6789 # nzbget
      80 443 # caddy
      8123 # home assistant
      8096 8920 7359 # jellyfin
      5055 # jellyseerr
      53
    ];
    allowedUDPPorts = [
      config.networking.wg-quick.interfaces.wg0.listenPort # mullvad vpn
      53
    ];
    # for wireguard
    checkReversePath = false;

  };
}
