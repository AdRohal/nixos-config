{ pkgs, ... }:

let
  customIpExtension = pkgs.stdenvNoCC.mkDerivation {
    pname = "custom-ip-gnome-extension";
    version = "1.0";

    src = ./custom-ip-extension;

    installPhase = ''
      mkdir -p $out/share/gnome-shell/extensions/custom-ip@adrohal
      cp -r ./* $out/share/gnome-shell/extensions/custom-ip@adrohal/
    '';
  };
in
{
  environment.systemPackages = [
    customIpExtension
  ];
}
