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

    # Development
    vscode
    nodejs_24
    pnpm
    typescript
    github-cli
    postgresql
    dotnet-sdk_10
  ];
}
