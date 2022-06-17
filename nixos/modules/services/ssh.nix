{ pkgs, config, ... }:
{
  services.openssh = {
    enable = true;
  };
}
