#!/bin/bash
# Claude Code status line for the Flutter+Firebase Agency template
# Shows: phase, current branch, flutter version tag, sprint

STATE_FILE="STATE.md"
PHASE="unknown"
if [ -f "$STATE_FILE" ]; then
    PHASE=$(grep -oE 'Fase actual: [^.]*' "$STATE_FILE" | head -1 | sed 's/Fase actual: //' | cut -c1-40)
fi

BRANCH=$(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo "—")

FLUTTER_TAG="flutter?"
if command -v flutter >/dev/null 2>&1; then
    FLUTTER_TAG=$(flutter --version 2>/dev/null | head -1 | awk '{print $1"@"$2}')
fi

SPRINT="—"
if [ -d "production/sprints" ]; then
    LATEST=$(ls -t production/sprints/*.md 2>/dev/null | head -1)
    if [ -n "$LATEST" ]; then
        SPRINT=$(basename "$LATEST" .md)
    fi
fi

printf "[%s] %s | %s | sprint:%s" "$PHASE" "$FLUTTER_TAG" "$BRANCH" "$SPRINT"
