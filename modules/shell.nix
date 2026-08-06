{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;

    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;

    shellAliases = {
      ll = "eza -lah --icons";
      la = "eza -la --icons";
      lt = "eza --tree";
      ls = "eza";

      cat = "bat";

      gs = "git status";
      ga = "git add .";
      gp = "git push";
      gl = "git log --oneline --graph --decorate";

      cls = "clear";
    };
  };
}
