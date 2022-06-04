rec {
  networkGroups = [ "networkmanager" ];
  printerGroups = [ "lp" "dialout" "scanner" ]; # printing, and usb device access
  adminGroups = [ "wheel" "video" "docker" ];
  desktopGroups = printerGroups ++ networkGroups;
}
