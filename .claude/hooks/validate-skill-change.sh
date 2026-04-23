#!/bin/bash
# PostToolUse (Write/Edit): remind the user to test any skill they just edited.
INPUT=$(cat)
PATH_FILE=$(echo "$INPUT" | jq -r '.tool_input.file_path // ""' 2>/dev/null)

case "$PATH_FILE" in
    */.claude/skills/*/SKILL.md) ;;
    *) exit 0 ;;
esac

SKILL=$(echo "$PATH_FILE" | sed -E 's#.*/\.claude/skills/([^/]+)/SKILL\.md#\1#')
echo "ℹ️  Skill '$SKILL' changed. Run it once end-to-end to verify behaviour." >&2
exit 0
