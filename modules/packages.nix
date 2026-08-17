{ pkgs, ... }:

{
	environment.systemPackages = with pkgs; [
		# General
		git
		appimage-run
		tailscale
		scrcpy
		android-tools

		# GNOME
		gnome-tweaks
		gnome-extension-manager
		gnome-browser-connector
            gnomeExtensions.quick-sound-switcher
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
		zsh-autosuggestions
		zsh-syntax-highlighting

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
		python3
		python3Packages.pip

		# Cybersecurity
		nmap
		wireshark
		tcpdump
		netcat
        net-tools
        iw
        wirelesstools
		whois
		traceroute
		curl
        openssl
        playerctl
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
        tor
		john
		binwalk

		# Communication
		discord
		teams-for-linux

		# PostgreSQL
		pgadmin4

		# Network Monitoring
		ntopng
		vnstat
		iftop
		bmon
		nethogs
	];
}
