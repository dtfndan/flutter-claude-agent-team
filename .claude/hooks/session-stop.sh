#!/bin/bash
# SessionStop: archive active session notes and capture a terse git delta.
set -e

STATE_DIR="production/session-state"
ACTIVE="$STATE_DIR/active.md"
ARCHIVE_DIR="$STATE_DIR/archive"
STAMP=$(date +%Y-%m-%d_%H-%M-%S)

if [ -f "$ACTIVE" ]; then
    mkdir -p "$ARCHIVE_DIR"
    cp "$ACTIVE" "$ARCHIVE_DIR/active-$STAMP.md"
fi

LOG_DIR="production/agent-log"
mkdir -p "$LOG_DIR" 2>/dev/null || true

{
    echo "## Session end $STAMP"
    git log --since="6 hours ago" --oneline 2>/dev/null | sed 's/^/  /' || true
    git status --short 2>/dev/null | sed 's/^/  /' || true
} >> "$LOG_DIR/sessions.md" 2>/dev/null || true

exit 0
