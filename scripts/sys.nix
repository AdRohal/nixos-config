{ pkgs }:

pkgs.writeShellScriptBin "sys" ''
case "$1" in
  "")
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "        💻 System Center"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""

    echo "Hostname : $(hostname)"
    echo "Kernel   : $(uname -r)"
    echo "Uptime   : $(uptime -p)"
    echo ""

    echo "CPU Usage"
    top -bn1 | grep "Cpu(s)" | awk '{print "  " 100-$8 "%"}'

    echo ""
    echo "Memory"
    free -h | awk '/Mem:/ {print "  Used: " $3 " / " $2}'

    echo ""
    echo "Disk"
    df -h / | awk 'NR==2 {print "  Used: " $3 " / " $2 " (" $5 ")"}'

    echo ""
    echo "Commands"
    echo "  sys cpu"
    echo "  sys mem"
    echo "  sys disk"
    echo "  sys uptime"
    ;;

  cpu)
    top
    ;;

  mem)
    free -h
    ;;

  disk)
    df -h
    ;;

  uptime)
    uptime
    ;;

  *)
    echo "Unknown command."
    ;;
esac
''
