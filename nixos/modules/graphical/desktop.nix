{ config, pkgs, ... }:
{
  imports = [
    ./fonts.nix
    ./gnome.nix
    ./themes.nix
  ];
  services.xserver = {
    enable = true;
    xkb = {
    	layout = "us";
    	variant = "";
	model = "pc105";
    };
  };
  
  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    
    # If you want to use JACK applications, uncomment this
    # jack.enable = true;
  };
  
  # Enable networking
  networking.networkmanager.enable = true;
}
