#!/bin/bash
# PostToolUse (Write|Edit): run dart analyze on the modified Dart file and
# feed errors/warnings back to Claude so it can self-correct immediately.
# Silent on success to avoid noise; only speaks when there are real issues.

INPUT=$(cat)
FILE=$(echo "$INPUT" | jq -r '.tool_input.file_path // ""' 2>/dev/null)

# Only .dart files inside lib/ or test/
case "$FILE" in
  *.dart) ;;
  *) exit 0 ;;
esac

case "$FILE" in
  */lib/*|lib/*|*/test/*|test/*) ;;
  *) exit 0 ;;
esac

[ ! -f "$FILE" ] && exit 0
command -v dart >/dev/null 2>&1 || exit 0

# dart analyze targets the file; Dart loads the project context automatically.
RESULT=$(dart analyze "$FILE" 2>&1)
EXIT_CODE=$?

# Exit 0 from dart analyze = no issues → silent.
[ $EXIT_CODE -eq 0 ] && exit 0

# Keep only error and warning lines (drop hints/infos and the summary line).
ISSUES=$(echo "$RESULT" | grep -E "error •|warning •" | head -20)

# If only hints/infos remain, stay silent.
[ -z "$ISSUES" ] && exit 0

COUNT=$(echo "$ISSUES" | grep -c ".")
BASENAME=$(basename "$FILE")

echo "" >&2
echo "dart analyze — $COUNT issue(s) in $BASENAME" >&2
echo "─────────────────────────────────────────" >&2
echo "$ISSUES" >&2
echo "─────────────────────────────────────────" >&2
echo "Corrige estos errores antes de continuar." >&2
echo "" >&2

# Exit 0: informamos a Claude pero no bloqueamos el Write/Edit ya hecho.
exit 0
