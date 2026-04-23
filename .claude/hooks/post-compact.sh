#!/bin/bash
# PostCompact: remind Claude to reload state from PLAN.md, STATE.md, active.md.
STATE_FILE="production/session-state/active.md"
echo "=== Post-Compact Reminder ==="
echo "Context was just compacted. Before proposing new work:"
echo "  1. Read PLAN.md (sections: UX/UI, Arquitectura, Backend, QA, Auditoría, Deploy, Growth)"
echo "  2. Read STATE.md (current phase)"
[ -f "$STATE_FILE" ] && echo "  3. Read $STATE_FILE (session snapshot from pre-compact)"
echo "============================="
exit 0
