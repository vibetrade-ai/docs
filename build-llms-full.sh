#!/bin/bash
# Regenerates llms-full.txt from all markdown source files.
# Run this whenever you update any .md file.

OUT="llms-full.txt"

cat > "$OUT" << 'HEADER'
# Vibe Trade — Full Documentation

> Vibe Trade is an agentic trading harness. Six primitives give an LLM everything it needs to trade autonomously on your behalf — with live market data, automated monitoring, a structured permission system, and a compounding memory of every decision it makes.

Source: https://docs.vibetrade.app
Repository: https://github.com/YOUR_ORG/vibe-trade-site

---

HEADER

for file in \
  docs/introduction.md \
  docs/what-is-vibe-trade.md \
  docs/the-harness.md \
  docs/how-primitives-connect.md \
  docs/example-app.md \
  primitives/market-tooling.md \
  primitives/heartbeat.md \
  primitives/triggers.md \
  primitives/permissions.md \
  primitives/playbooks.md \
  primitives/learnings.md \
  primitives/skills.md \
  docs/primitives-at-a-glance.md \
  docs/data-flow.md; do
  echo "" >> "$OUT"
  cat "$file" >> "$OUT"
  echo "" >> "$OUT"
  echo "---" >> "$OUT"
done

echo "✓ Built $OUT ($(wc -l < "$OUT") lines)"
