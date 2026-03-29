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
      6623 # glance
      2283 2284 # immich
      2049 111 4000 4001 4002 20048 # nfs
    ];
    allowedUDPPorts = [
      config.networking.wg-quick.interfaces.wg0.listenPort # mullvad vpn
      53
      2049 111 4000 4001 4002 20048 # nfs
    ];
    # for wireguard
    checkReversePath = false;

  };
}
