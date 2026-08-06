{ pkgs }:

pkgs.writeShellScriptBin "lab" ''
case "$1" in
  "")
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "      🧪 Cybersecurity Lab"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""

    echo "Installed Tools"

    for tool in \
      nmap \
      bettercap \
      wireshark \
      tcpdump \
      burpsuite \
      sqlmap \
      ffuf \
      hashcat \
      john
    do
      if command -v "$tool" >/dev/null 2>&1; then
        printf "  %-12s ✅\n" "$tool"
      else
        printf "  %-12s ❌\n" "$tool"
      fi
    done

    echo ""
    echo "Commands"
    echo "  lab nmap"
    echo "  lab bettercap"
    echo "  lab wireshark"
    echo "  lab burp"
    echo "  lab sqlmap"
    echo ""
    ;;

  nmap)
    exec nmap
    ;;

  bettercap)
    exec sudo bettercap
    ;;

  wireshark)
    exec wireshark
    ;;

  burp)
    exec burpsuite
    ;;

  sqlmap)
    exec sqlmap
    ;;

  *)
    echo "Unknown command."
    ;;
esac
''
