{ config, pkgs, ... }:
{
  services.glance = {
    enable = true;
    openFirewall = true;
    settings = {
      server.port = 6623;
      server.host = "0.0.0.0";
      pages = [
        {
          name = "Home";
          columns = [
            {
              size = "small";
              widgets = [
                { type = "clock"; "hour-format" = "12h"; }
                { type = "calendar"; }
              ];
            }
            {
              size = "full";
              widgets = [
                {
                  type = "monitor";
                  title = "Media";
                  sites = [
                    { title = "Jellyfin"; url = "http://cedar:8096"; icon = "si:jellyfin"; }
                    { title = "Jellyseerr"; url = "http://cedar:5055"; }
                    { title = "Immich"; url = "http://cedar:2283"; icon = "si:immich"; }
                  ];
                }
                {
                  type = "monitor";
                  title = "arr Stack";
                  sites = [
                    { title = "Radarr"; url = "http://cedar:7878"; icon = "si:radarr"; }
                    { title = "Sonarr"; url = "http://cedar:8989"; icon = "si:sonarr"; }
                    { title = "Prowlarr"; url = "http://cedar:9696"; }
                    { title = "NZBGet"; url = "http://cedar:6789"; }
                    { title = "qBittorrent"; url = "http://cedar:8080"; icon = "si:qbittorrent"; }
                  ];
                }
                {
                  type = "monitor";
                  title = "Infrastructure";
                  sites = [
                    { title = "Home Assistant"; url = "http://cedar:8123"; icon = "si:homeassistant"; }
                  ];
                }
              ];
            }
            {
              size = "small";
              widgets = [
                { type = "weather"; location = "Austin, Texas, United States"; units = "imperial"; }
              ];
            }
          ];
        }
      ];
    };
  };
}
