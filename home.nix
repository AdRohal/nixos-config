{ config, pkgs, ... }:

{
  home.username = "adrohal";
  home.homeDirectory = "/home/adrohal";

  home.stateVersion = "26.05";

  programs.home-manager.enable = true;

  programs.starship = {
    enable = true;
  };
	programs.zsh = {
  enable = true;

  autosuggestion.enable = true;
  syntaxHighlighting.enable = true;
  enableCompletion = true;

  shellAliases = {
    ls = "eza";
    ll = "eza -lah --icons";
    la = "eza -la --icons";
    lt = "eza --tree";

    cat = "bat";

    gs = "git status";
    ga = "git add .";
    gp = "git push";
    gl = "git log --oneline --graph --decorate";

    cls = "clear";
    c = "clear";
  };

  		initContent = ''
    		eval "$(zoxide init zsh)"

    		if command -v fastfetch >/dev/null; then
      		fastfetch
    		fi
  		'';
	};
}
