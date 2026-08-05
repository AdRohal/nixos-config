{ pkgs, ... }:

{
  programs.zsh.enable = true;

  users.users.adrohal = {
    shell = pkgs.zsh;
  };
}
