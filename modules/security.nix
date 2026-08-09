{ config, pkgs, lib, ... }:

{
  ############################################################
  # Linux Audit
  ############################################################

  security.audit.enable = true;
  security.auditd.enable = true;

  ############################################################
  # Nix Maintenance
  ############################################################

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  nix.optimise = {
    automatic = true;
    dates = [ "weekly" ];
  };

  ############################################################
  # Firewall
  ############################################################

  networking.firewall = {
    enable = true;
    allowPing = false;
  };

  ############################################################
  # Kernel Hardening
  ############################################################

  boot.kernel.sysctl = {
    "kernel.dmesg_restrict" = 1;
    "kernel.kptr_restrict" = 2;
    "kernel.sysrq" = 0;

    "kernel.unprivileged_bpf_disabled" = 1;
    "kernel.yama.ptrace_scope" = 1;

    "net.ipv4.conf.all.accept_redirects" = 0;
    "net.ipv4.conf.default.accept_redirects" = 0;

    "net.ipv6.conf.all.accept_redirects" = 0;
    "net.ipv6.conf.default.accept_redirects" = 0;

    "net.ipv4.conf.all.accept_source_route" = 0;
    "net.ipv4.conf.default.accept_source_route" = 0;

    "net.ipv6.conf.all.accept_source_route" = 0;
    "net.ipv6.conf.default.accept_source_route" = 0;

    "net.ipv4.icmp_echo_ignore_broadcasts" = 1;
    "net.ipv4.icmp_ignore_bogus_error_responses" = 1;

    "net.ipv4.tcp_syncookies" = 1;

    "fs.protected_symlinks" = 1;
    "fs.protected_hardlinks" = 1;
  };

  ############################################################
  # Disable Core Dumps
  ############################################################

  systemd.coredump.enable = false;

	############################################################
  	# ClamAV
  	############################################################

  	services.clamav = {
    		daemon.enable = true;

    		updater = {
      		enable = true;
      		interval = "daily";
    		};
  	};

}
