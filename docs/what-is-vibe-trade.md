# What is Vibe Trade?

Vibe Trade is the backend for agentic trading. Just as infrastructure platforms give developers a database, auth, and storage without making them build those systems from scratch, Vibe Trade gives an AI trading agent a live market connection, a scheduling system, a strategy memory, an audit trail, a monitoring loop, and a permission gate — without you having to build any of it.

You describe what you want to trade and why. The agent figures out how. The harness makes sure it runs reliably, accountably, and only as far as you've permitted.

---

## What it gives you

### Live market awareness

20 built-in tools covering broker execution, real-time quotes, candles, indicators, fundamentals, ETFs, news, and index data. The agent never reasons from stale training data.

### Strategy memory that persists

The agent doesn't start from zero each session. A written [Playbook](primitives/playbooks.md) anchors every decision it makes — consistent rules, consistent judgement, isolated P\&L.

### Runs on its own schedule

Set a trigger once. The agent wakes itself up, reasons from live data, and acts — without you being present. See [Triggers](primitives/triggers.md) and [Heartbeat](primitives/heartbeat.md).

### No trade without your consent

A code-level approval gate sits in front of every execution. You define what consent looks like at each level of autonomy. See [Permissions](primitives/permissions.md).
