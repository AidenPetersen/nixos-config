# I'll set it up when I feel like it
{ pkgs, config, ... }:
let
  user = "aidenp";
  dataDir = "/home/${user}/Sync";
  devices = {};
  deviceNames = builtins.attrNames devices;
  
in {
  services.syncthing = {
    inherit dataDir;
    inherit user;
    inherit devices;
    enable = true;
    configDir = "/home/${user}/.config/syncthing";
    
    folders = {};
    
    # overrides things added and deleted in webUI
    overrideFolders = true; 
    overrideDevices = true;
  };
}
