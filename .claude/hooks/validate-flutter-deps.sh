#!/bin/bash
# PostToolUse (Write/Edit): enforce the "always-latest-stable" rule when
# pubspec.yaml is touched. Warn if we see fully-pinned versions without a reason.
INPUT=$(cat)
PATH_FILE=$(echo "$INPUT" | jq -r '.tool_input.file_path // ""' 2>/dev/null)

case "$PATH_FILE" in
    */pubspec.yaml|pubspec.yaml) ;;
    */package.json|package.json) ;;
    *) exit 0 ;;
esac

[ ! -f "$PATH_FILE" ] && exit 0

# Flag exact-pinned versions (no caret, no range) that may be stale
# Exact-pinned entries in pubspec dependencies look like:  package: 1.2.3
if [[ "$PATH_FILE" == *pubspec.yaml ]]; then
    PINNED=$(grep -cE '^  [a-z0-9_]+: [0-9]+\.[0-9]+\.[0-9]+$' "$PATH_FILE" 2>/dev/null || echo 0)
    if [ "$PINNED" -gt 0 ]; then
        echo "ℹ️  $PATH_FILE has $PINNED fully-pinned package versions." >&2
        echo "   Remember: the version-policy asks for the latest stable with caret (^)," >&2
        echo "   unless you documented why in PLAN.md." >&2
    fi
fi

exit 0
