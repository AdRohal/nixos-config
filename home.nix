{ config, pkgs, ... }:

{
  ############################################################
  # Home
  ############################################################

  home.username = "adrohal";
  home.homeDirectory = "/home/adrohal";
  home.stateVersion = "26.05";

  ############################################################
  # Home Manager
  ############################################################

  programs.home-manager.enable = true;

  ############################################################
  # Starship
  ############################################################

  programs.starship = {
    enable = true;
  };

  ############################################################
  # Zsh
  ############################################################

  programs.zsh = {
    enable = true;

    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      # Navigation
      ls = "eza";
      ll = "eza -lah --icons";
      la = "eza -la --icons";
      lt = "eza --tree";

      # Utilities
      cat = "bat";
      cls = "clear";
      c = "clear";

      # Git
      gs = "git status";
      ga = "git add .";
      gp = "git push";
      gl = "git log --oneline --graph --decorate";
    };

    initContent = ''
      eval "$(zoxide init zsh)"

      if command -v fastfetch >/dev/null; then
        fastfetch
      fi
    '';
  };

  ############################################################
  # Git
  ############################################################

  # programs.git = {
  #   enable = true;
  #
  #   userName = "Adam Rohal";
  #   userEmail = "YOUR_EMAIL@example.com";
  #
  #   delta.enable = true;
  #
  #   extraConfig = {
  #     init.defaultBranch = "main";
  #     pull.rebase = false;
  #     push.autoSetupRemote = true;
  #     color.ui = true;
  #   };
  # };

  ############################################################
  # Future
  ############################################################

  # GTK
  # Fonts
  # VS Code
  # SSH
  # GPG
  # Direnv
  # Development
}
