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

      cedar {
        reverse_proxy localhost:6623
        tls internal
      }

      https://cedar:3001 {
        reverse_proxy localhost:3000
        tls internal
      }

      https://cedar:2284 {
        reverse_proxy localhost:2283
        tls internal
      }
    '';

  };

}
