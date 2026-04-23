#!/bin/bash
# SessionStart: load project context so agents can pick up where we left off
echo "=== Flutter + Firebase Agency — Session Context ==="

if [ -f STATE.md ]; then
    PHASE=$(head -3 STATE.md | grep -i 'fase actual' | head -1)
    [ -n "$PHASE" ] && echo "$PHASE"
fi

BRANCH=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
if [ -n "$BRANCH" ]; then
    echo "Branch: $BRANCH"
    echo ""
    echo "Recent commits:"
    git log --oneline -5 2>/dev/null | sed 's/^/  /'
fi

if command -v flutter >/dev/null 2>&1; then
    echo ""
    echo "Flutter: $(flutter --version 2>/dev/null | head -1)"
fi

LATEST_SPRINT=$(ls -t production/sprints/sprint-*.md 2>/dev/null | head -1)
if [ -n "$LATEST_SPRINT" ]; then
    echo "Active sprint: $(basename "$LATEST_SPRINT" .md)"
fi

if [ -d lib ]; then
    TODOS=$(grep -rE "TODO|FIXME" lib/ 2>/dev/null | wc -l)
    [ "$TODOS" -gt 0 ] && echo "Code health: $TODOS TODO/FIXME markers in lib/"
fi

STATE_FILE="production/session-state/active.md"
if [ -f "$STATE_FILE" ]; then
    echo ""
    echo "=== ACTIVE SESSION STATE DETECTED ==="
    echo "A previous session left state at: $STATE_FILE"
    echo "Read it before writing anything so you can continue coherently."
    echo ""
    head -20 "$STATE_FILE" 2>/dev/null
    TOTAL=$(wc -l < "$STATE_FILE" 2>/dev/null)
    [ "$TOTAL" -gt 20 ] && echo "  ... ($TOTAL lines total)"
    echo "=== END SESSION STATE PREVIEW ==="
fi

echo "==================================="
exit 0
