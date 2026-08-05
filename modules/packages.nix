{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    appimage-run

    gnome-tweaks
    gnome-extension-manager

    papirus-icon-theme
    bibata-cursors
    jetbrains-mono
    orchis-theme
  ];
}
