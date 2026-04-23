#!/bin/bash
# SubagentStart: append a line to the agent audit trail.
INPUT=$(cat)
LOG_DIR="production/agent-log"
mkdir -p "$LOG_DIR" 2>/dev/null
STAMP=$(date +%Y-%m-%d_%H:%M:%S)
AGENT=$(echo "$INPUT" | jq -r '.subagent_type // .agent // "unknown"' 2>/dev/null)
DESC=$(echo "$INPUT" | jq -r '.description // ""' 2>/dev/null | head -c 120)
echo "$STAMP START agent=$AGENT desc=\"$DESC\"" >> "$LOG_DIR/agents.log" 2>/dev/null
exit 0
