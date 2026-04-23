#!/bin/bash
# Notification: desktop notification when Claude needs attention.
INPUT=$(cat)
MSG=$(echo "$INPUT" | jq -r '.message // "Claude Code needs input"' 2>/dev/null)

case "$(uname -s)" in
    MINGW*|MSYS*|CYGWIN*)
        powershell.exe -NoProfile -Command "New-BurntToastNotification -Text 'Claude Code','$MSG' -ErrorAction SilentlyContinue" 2>/dev/null || \
        powershell.exe -NoProfile -Command "Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('$MSG','Claude Code')" 2>/dev/null &
        ;;
    Darwin)
        osascript -e "display notification \"$MSG\" with title \"Claude Code\"" 2>/dev/null
        ;;
    Linux)
        command -v notify-send >/dev/null && notify-send "Claude Code" "$MSG" 2>/dev/null
        ;;
esac

exit 0
