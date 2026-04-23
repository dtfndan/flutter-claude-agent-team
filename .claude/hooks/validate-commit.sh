#!/bin/bash
# PreToolUse (Bash): reject commits that include secrets or hardcoded API keys.
# Exits 0 fast if the command is not a git commit.
INPUT=$(cat)
CMD=$(echo "$INPUT" | jq -r '.tool_input.command // ""' 2>/dev/null)

case "$CMD" in
    *"git commit"*) ;;
    *) exit 0 ;;
esac

STAGED=$(git diff --cached --name-only 2>/dev/null)
[ -z "$STAGED" ] && exit 0

FAIL=0

# Block obvious secret files
for f in $STAGED; do
    case "$f" in
        *.env|*.env.*|**/google-services.json|**/GoogleService-Info.plist|**/service-account*.json|**/firebase-adminsdk*.json|**/*.keystore|**/*.jks|**/key.properties)
            echo "❌ BLOCKED: $f contains secrets and must never be committed." >&2
            FAIL=1
            ;;
    esac
done

# Look for patterns that look like real API keys inside diff
DIFF=$(git diff --cached 2>/dev/null)
if echo "$DIFF" | grep -qE '(AIza[0-9A-Za-z_-]{35}|sk-[A-Za-z0-9]{32,}|ghp_[A-Za-z0-9]{36,}|AKIA[0-9A-Z]{16})'; then
    echo "❌ BLOCKED: staged diff contains what looks like an API key/token." >&2
    echo "   Move it to .env or Firebase Secret Manager before committing." >&2
    FAIL=1
fi

# Warn on TODO without owner
TODO_NO_OWNER=$(echo "$DIFF" | grep -E '^\+.*TODO' | grep -vE 'TODO\([^)]+\)' | wc -l)
if [ "$TODO_NO_OWNER" -gt 0 ]; then
    echo "⚠️  Warning: $TODO_NO_OWNER new TODO(s) without owner. Prefer TODO(name)." >&2
fi

[ "$FAIL" -eq 1 ] && exit 2
exit 0
