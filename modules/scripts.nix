{ pkgs, ... }:

{
  environment.systemPackages = [
    (import ../scripts/net.nix { inherit pkgs; })
    (import ../scripts/sec.nix { inherit pkgs; })
    (import ../scripts/sys.nix { inherit pkgs; })
    (import ../scripts/dev.nix { inherit pkgs; })
    (import ../scripts/lab.nix { inherit pkgs; })
    (import ../scripts/update.nix { inherit pkgs; })
  ];
}
