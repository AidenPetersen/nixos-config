{ config, pkgs, ... }:
{
  services.fail2ban = {
    enable = true;
    jails = {
      jellyfin.settings = {
        filter = "jellyfin";
        logpath = "/var/lib/jellyfin/log/*.log";
        backend = "auto";
        findtime = 43200;
        bantime  = 86400;
        maxretry = 5;
      };
    };
  };
}
