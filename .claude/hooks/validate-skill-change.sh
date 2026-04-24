#!/bin/bash
# PostToolUse (Write/Edit): remind the user to test any slash command they just edited.
INPUT=$(cat)
PATH_FILE=$(echo "$INPUT" | jq -r '.tool_input.file_path // ""' 2>/dev/null)

case "$PATH_FILE" in
    */.claude/commands/*.md) ;;
    *) exit 0 ;;
esac

CMD=$(echo "$PATH_FILE" | sed -E 's#.*/\.claude/commands/([^/]+)\.md#\1#')
echo "i  Command '/$CMD' changed. Run it once end-to-end to verify behaviour." >&2
exit 0
