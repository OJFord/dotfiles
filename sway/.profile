systemctl --user import-environment DISPLAY
if [ -n "$SWAYSOCK" ]; then
    systemctl --user import-environment SWAYSOCK
fi
