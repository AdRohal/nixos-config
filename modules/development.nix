{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Rust
    rustc
    cargo
    rustfmt
    clippy

    # C toolchain
    gcc
    pkg-config

    # Tauri/Linux dependencies
    dbus
    glib
  ];
}
