{ pkgs, ... }:

{
  environment.systemPackages = [

    (pkgs.writeShellScriptBin "net" ''
      case "$1" in
        "")
          echo ""
          echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
          echo "        🌐 Network Center"
          echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
          echo ""
          echo " Dashboard"
          echo "   http://localhost:3000"
          echo ""
          echo " Commands"
          echo "   net open      Open ntopng"
          echo "   net traffic   vnStat"
          echo "   net speed     bmon"
          echo "   net hogs      nethogs"
          echo "   net capture   tcpdump"
          echo ""
          ;;

        open)
          xdg-open http://localhost:3000 >/dev/null 2>&1
          ;;

        traffic)
          exec vnstat
          ;;

        speed)
          exec bmon
          ;;

        hogs)
          exec sudo nethogs
          ;;

        capture)
          exec sudo tcpdump
          ;;

        *)
          echo "Unknown command: $1"
          ;;
      esac
    '')

	(pkgs.writeShellScriptBin "sec" ''
  case "$1" in
    "")
      echo ""
      echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
      echo "         🛡 Security Center"
      echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
      echo ""

      if systemctl is-active --quiet auditd; then
        echo " Auditd      : ✅ Running"
      else
        echo " Auditd      : ❌ Stopped"
      fi

      if systemctl is-active --quiet clamav-daemon; then
        echo " ClamAV      : ✅ Running"
      else
        echo " ClamAV      : ⚪ Installed"
      fi

      echo ""
      echo "Commands"
      echo "  sec audit"
      echo "  sec ports"
      echo "  sec logs"
      echo "  sec scan"
      echo ""
      ;;

    audit)
      sudo aureport
      ;;

    ports)
      ss -tulpn
      ;;

    logs)
      journalctl -p warning -b
      ;;

    scan)
      clamscan -r ~/Downloads
      ;;

    *)
      echo "Unknown command: $1"
      ;;
  esac
'')
  ];
}
