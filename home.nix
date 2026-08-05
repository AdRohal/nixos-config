{ config, pkgs, ... }:

{
  home.username = "adrohal";
  home.homeDirectory = "/home/adrohal";

  home.stateVersion = "26.05";

  programs.home-manager.enable = true;

  programs.starship = {
    enable = true;
  };

  programs.bash = {
    enable = true;

    shellAliases = {
      ls = "eza";
      ll = "eza -lah";
      cat = "bat";
    };

    initExtra = ''
      eval "$(zoxide init bash)"
      eval "$(starship init bash)"

      if command -v fastfetch >/dev/null; then
        fastfetch
      fi
    '';
  };
}
