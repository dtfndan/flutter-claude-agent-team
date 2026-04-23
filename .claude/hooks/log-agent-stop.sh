#!/bin/bash
# SubagentStop: close the audit trail entry.
INPUT=$(cat)
LOG_DIR="production/agent-log"
mkdir -p "$LOG_DIR" 2>/dev/null
STAMP=$(date +%Y-%m-%d_%H:%M:%S)
AGENT=$(echo "$INPUT" | jq -r '.subagent_type // .agent // "unknown"' 2>/dev/null)
echo "$STAMP STOP  agent=$AGENT" >> "$LOG_DIR/agents.log" 2>/dev/null
exit 0
