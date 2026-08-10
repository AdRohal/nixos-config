# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
	imports =
		[
			# Include the results of the hardware scan.
			./hardware-configuration.nix
			./modules/packages.nix
./modules/custom-ip.nix
			./modules/desktop.nix
			./modules/fonts.nix
			./modules/users.nix
			./modules/development.nix
			./modules/security.nix
			./modules/networking.nix
			./modules/scripts.nix
		];

	# Bootloader.
	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	# Use the latest stable Linux kernel
	boot.kernelPackages = pkgs.linuxPackages_latest;

	networking.hostName = "nixos";
	# networking.wireless.enable = true;

	# Configure network proxy if necessary
	# networking.proxy.default = "http://user:password@proxy:port/";
	# networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

	# Enable networking
	networking.networkmanager.enable = true;

	# Enable Tailscale
	services.tailscale.enable = true;

	# Firewall
	networking.firewall = {
		enable = true;

		allowedTCPPortRanges = [
			{
				from = 1714;
				to = 1764;
			}
		];

		allowedUDPPortRanges = [
			{
				from = 1714;
				to = 1764;
			}
		];
	};

	# Set your time zone.
	time.timeZone = "Africa/Casablanca";

	# Select internationalisation properties.
	i18n.defaultLocale = "en_US.UTF-8";

	i18n.extraLocaleSettings = {
		LC_ADDRESS = "en_US.UTF-8";
		LC_IDENTIFICATION = "en_US.UTF-8";
		LC_MEASUREMENT = "en_US.UTF-8";
		LC_MONETARY = "en_US.UTF-8";
		LC_NAME = "en_US.UTF-8";
		LC_NUMERIC = "en_US.UTF-8";
		LC_PAPER = "en_US.UTF-8";
		LC_TELEPHONE = "en_US.UTF-8";
		LC_TIME = "en_US.UTF-8";
	};

	# Configure keymap in X11
	services.xserver.xkb = {
		layout = "us";
		variant = "";
	};

	# Enable CUPS to print documents.
	services.printing.enable = true;

	# Enable sound with PipeWire.
	services.pulseaudio.enable = false;
	security.rtkit.enable = true;

	services.pipewire = {
		enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
		# jack.enable = true;
	};

	# Define your user account.
	users.users."adrohal" = {
		isNormalUser = true;
		description = "Adam";
		extraGroups = [
			"networkmanager"
			"wheel"
			"wireshark"
		];
		packages = with pkgs; [
			# thunderbird
		];
	};

	# Firefox
	programs.firefox.enable = true;

	# Wireshark
	programs.wireshark.enable = true;

	# Allow unfree packages
	nixpkgs.config.allowUnfree = true;

	# System packages
	environment.systemPackages = with pkgs; [
		wget
		appimage-run
		tailscale
	];

	# Enable OpenSSH if needed.
	# services.openssh.enable = true;

	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	system.stateVersion = "26.05";
}
