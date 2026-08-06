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

  ];
}
