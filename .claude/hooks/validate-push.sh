#!/bin/bash
# PreToolUse (Bash): warn (don't block) on pushes to protected branches.
INPUT=$(cat)
CMD=$(echo "$INPUT" | jq -r '.tool_input.command // ""' 2>/dev/null)

case "$CMD" in
    *"git push"*) ;;
    *) exit 0 ;;
esac

BRANCH=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
case "$BRANCH" in
    main|master|release|production)
        echo "⚠️  About to push '$BRANCH' — that branch is protected in most workflows." >&2
        echo "   Prefer opening a PR from a feature branch." >&2
        ;;
esac

case "$CMD" in
    *"--force"*|*" -f "*|*" -f"*)
        echo "❌ --force / -f detected on push. Use --force-with-lease and confirm the rewrite is intentional." >&2
        exit 2
        ;;
esac

exit 0
