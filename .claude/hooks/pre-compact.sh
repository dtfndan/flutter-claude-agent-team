#!/bin/bash
# PreCompact: dump a short snapshot of the current working state before the
# conversation is compacted so it can be restored afterwards.
STATE_DIR="production/session-state"
ACTIVE="$STATE_DIR/active.md"
mkdir -p "$STATE_DIR"

STAMP=$(date +%Y-%m-%d_%H:%M)
BRANCH=$(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo "—")
PHASE=$(grep -iE 'fase actual' STATE.md 2>/dev/null | head -1)

{
    echo "# Active Session Snapshot — $STAMP"
    echo ""
    echo "- Branch: \`$BRANCH\`"
    echo "- $PHASE"
    echo ""
    echo "## Recent commits"
    git log --oneline -10 2>/dev/null | sed 's/^/- /' || true
    echo ""
    echo "## Working tree"
    git status --short 2>/dev/null || true
    echo ""
    echo "## Notes"
    echo "- Context was compacted at $STAMP. Read PLAN.md + STATE.md before continuing."
} > "$ACTIVE"

exit 0
