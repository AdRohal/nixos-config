{ pkgs, ... }:

{
  	environment.systemPackages = with pkgs; [
    	# General
    	git
    	appimage-run

    	# GNOME
    	gnome-tweaks
    	gnome-extension-manager
    	gnome-browser-connector
    	libgda5
    	gsound
    	mission-center

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
    	figlet
    	toilet

	# Utilities
	usbutils
	pciutils
	lsof
	strace
	tree
	unzip
	zip
	which
	file
	fd
	btop
	direnv
	just
   
     	# Security
    	lynis
     	clamav
     	aide

    	# Development
    	vscode
    	nodejs_24
    	pnpm
    	typescript
    	github-cli
    	postgresql
    	dotnet-sdk_10

    	# Cybersecurity
    	nmap
    	wireshark
    	tcpdump
    	netcat
    	whois
    	traceroute
    	curl
    	wget
    	jq
    	ripgrep
    	tmux
    	burpsuite
    	ffuf
    	sqlmap
    	nikto
    	bettercap
    	aircrack-ng
    	hashcat
    	john
	binwalk

    	# Communication
    	discord
    	teams-for-linux

    	# PostgreSQL
    	pgadmin4
  ];
}
