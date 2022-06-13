{ config, pkgs, ... }:
{
  gtk = {
    enable = true;

    # Set gtk3 theme to resemble libadw
    gtk3.extraConfig = {
      gtk-theme-name = "Adw-gtk3-dark";
      gtk-application-prefer-dark-theme = 0;
    };

    iconTheme.name = "Papirus-Dark";
    iconTheme.package = pkgs.papirus-icon-theme;
  };
}