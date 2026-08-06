{ pkgs }:

pkgs.writeShellScriptBin "sec" ''
case "$1" in
  "")
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "        🛡 Security Center"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""

    printf "%-15s" "Firewall:"
    if systemctl is-active --quiet firewall; then
      echo "✅ Running"
    else
      echo "⚪ Managed by NixOS"
    fi

    printf "%-15s" "Auditd:"
    if systemctl is-active --quiet auditd; then
      echo "✅ Running"
    else
      echo "❌ Stopped"
    fi

    printf "%-15s" "ClamAV:"
    if command -v clamscan >/dev/null; then
      echo "✅ Installed"
    else
      echo "❌ Missing"
    fi

    printf "%-15s" "AIDE:"
    if command -v aide >/dev/null; then
      echo "✅ Installed"
    else
      echo "❌ Missing"
    fi

    echo ""
    echo "Commands"
    echo "  sec scan"
    echo "  sec ports"
    echo "  sec logs"
    echo "  sec audit"
    echo ""
    ;;

  scan)
    sudo freshclam
    sudo clamscan -r ~/Downloads
    ;;

  ports)
    ss -tulpn
    ;;

  logs)
    journalctl -p warning -b
    ;;

  audit)
    if command -v aureport >/dev/null; then
      sudo aureport
    else
      echo "aureport is not installed."
    fi
    ;;

  *)
    echo "Unknown command."
    ;;
esac
''
