{ config, lib, pkgs, ... }:
{
  services.caddy = {
    enable = true;
    logFormat = "level DEBUG";
    environmentFile = "/home/aidenp/keys/caddy-env";
    extraConfig = ''
      jellyfin.aidenp.dev {
        header -X-Frame-Options {
          defer
        }
        reverse_proxy localhost:8096
      }
    '';

  };

}
