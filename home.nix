{ config, pkgs, ... }:

{
  home.username = "adrohal";
  home.homeDirectory = "/home/adrohal";

  home.stateVersion = "26.05";

  programs.home-manager.enable = true;
}
