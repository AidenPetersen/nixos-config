{ config, pkgs, ... }:
{
  networking.wg-quick.interfaces.wg0 = {
    configFile = "/home/aidenp/keys/wg0.conf";
    listenPort = 51280;
  };
}
