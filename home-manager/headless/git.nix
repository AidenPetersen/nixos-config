{ config, pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName  = "Aiden Petersen";
    userEmail = "AidenPetersen@protonmail.com";
  };
}