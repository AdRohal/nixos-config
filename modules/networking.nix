{ config, pkgs, lib, ... }:

{
  	############################################################
  	# vnStat
  	############################################################

  	services.vnstat.enable = true;

  	############################################################
  	# ntopng
  	############################################################

  	services.ntopng = {
    		enable = true;
  	};

  	############################################################
  	# Firewall
  	############################################################

  	networking.firewall.allowedTCPPorts = [
    		3000
  	];

  	services.avahi = {
  		enable = true;
  		nssmdns4 = true;
  		openFirewall = true;
  		publish.enable = true;
  		publish.addresses = true;
  		publish.workstation = true;
	};
}
