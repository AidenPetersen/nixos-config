{ config, pkgs, ... }:
{
  programs.git = {
    enable = true;

    # User info
    settings.user.name  = "Aiden Petersen";
    settings.user.email = "AidenPetersen@protonmail.com";
  };
  programs.gitui.enable = true;
  programs.delta.enable = true;
}
