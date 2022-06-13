{ config, pkgs, ... }:
{
  programs.git = {
    enable = true;

    # User info
    userName  = "Aiden Petersen";
    userEmail = "AidenPetersen@protonmail.com";

    # Extra git stuff
    delta.enable = true;
  };
  programs.gitui.enable = true;
}