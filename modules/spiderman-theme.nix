{ pkgs, ... }:

{
  home-manager.users.adrohal = {
    home.packages = [
      pkgs.gnome-tweaks
    ];

    dconf.settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
        accent-color = "red";

        font-name = "JetBrains Mono Nerd Font 11";
        monospace-font-name = "JetBrains Mono Nerd Font 11";

        icon-theme = "Papirus-Dark";
      };

      "org/gnome/desktop/background" = {
        picture-options = "zoom";

        picture-uri =
          "file:///home/adrohal/Pictures/Wallpaper/spider-man-logo-red-background-5k-8k-7680x4320-7214.png";

        picture-uri-dark =
          "file:///home/adrohal/Pictures/Wallpaper/spider-man-logo-red-background-5k-8k-7680x4320-7214.png";
      };
    };
  };
}
