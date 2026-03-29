{ config, pkgs, pkgs-unstable, ... }:

{

  # Service user
  users.groups.media = { gid = 1001; };
  users.users.media = {
    group = "media";
    isSystemUser = true;
    uid = 1001;
  };

  # radarr (movies)
  services.radarr = {
    enable = true;
    openFirewall = true;
    group = "media";
  };

  # sonarr (tv)
  services.sonarr = {
    enable = true;
    openFirewall = true;
    group = "media";
  };

  # prowlarr (indexers)
  services.prowlarr = {
    enable = true;
    openFirewall = true;
  };

  # recyclarr (profiles)
  services.recyclarr = {
    enable = true;
    group = "media";
  };

  # nzbget (usenet downloader)
  services.nzbget = {
    enable = true;
    group = "media";
    user = "media";
  };

  # qbittorrent (torrent downloader)
  services.qbittorrent = {
    enable = true;
    openFirewall = true;
    group = "media";
  };


  # jellyfin
  services.jellyfin = {
    enable = true;
    openFirewall = true;
    group = "media";
  };
  users.users.jellyfin.extraGroups = [ "video" "render" ];

  environment.systemPackages = [
    pkgs.jellyfin
    pkgs.jellyfin-web
    pkgs.jellyfin-ffmpeg
  ];

  # jellyseerr
  services.jellyseerr = {
    enable = true;
    openFirewall = true;
  };

  # bans people, config in /etc/fail2ban/jail.d
  services.fail2ban.enable = true;

  # tailscale
  services.tailscale.enable = true;
  services.tailscale.extraSetFlags = ["--netfilter-mode=nodivert"];

  # netbird
  services.netbird.clients.wt0 = {
    port = 51821;
    ui.enable = false;
    openFirewall = true;
    openInternalFirewall = true;
  };

  virtualisation.docker.enable = true;
  virtualisation.docker.storageDriver = "btrfs";

  # immich image hosting
  services.immich.enable = true; 
  services.immich.port = 2283;
  services.immich.host = "0.0.0.0";
  services.immich.group = "media";
  services.immich.openFirewall = true;
  services.immich.mediaLocation = "/storage_mirror/immich";




  # Containers
  # home assistant
  virtualisation.oci-containers = {
    backend = "podman";
    containers.homeassistant = {
      volumes = [ "home-assistant:/config" ];
      environment.TZ = "America/Chicago";
      # Note: The image will not be updated on rebuilds, unless the version label changes
      image = "ghcr.io/home-assistant/home-assistant:stable";
      extraOptions = [
        # Use the host network namespace for all sockets
        "--network=host"
        # Pass devices into the container, so Home Assistant can discover and make use of them
        "--device=/dev/ttyUSB0:/dev/ttyUSB0"
      ];
    };
  };
}
