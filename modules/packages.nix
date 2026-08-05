{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # General
    git
    appimage-run

    # GNOME
    gnome-tweaks
    gnome-extension-manager

    # Themes
    papirus-icon-theme
    bibata-cursors
    orchis-theme

    # Terminal
    ghostty
    fastfetch
    starship
    eza
    bat
    zoxide
    fzf
    zsh
  ];
}
