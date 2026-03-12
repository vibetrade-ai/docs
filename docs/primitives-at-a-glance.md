# Primitives at a Glance

| # | Primitive | What it gives the agent | Without it |
|---|-----------|------------------------|------------|
| 01 | [Market Tooling](primitives/market-tooling.md) | Live data and broker execution — 20 built-in tools, never reasoning from stale training data | Agent reasons in the dark; can't act on the market |
| 02 | [Heartbeat](primitives/heartbeat.md) | Always-on monitoring loop that wakes the agent only when a condition fires | Either runs 24/7 at full cost, or misses time-sensitive triggers entirely |
| 03 | [Triggers](primitives/triggers.md) | A condition and an action — the automation primitive that drives everything | Agent runs once and is forgotten; nothing is automated |
| 04 | [Permissions](primitives/permissions.md) | A code-level approval gate with three consent modes and a full audit trail | Agent acts without authorisation; no record of why |
| 05 | [Playbooks](primitives/playbooks.md) | A persistent strategy document loaded as context on every agent run | Every session starts from zero; no consistent identity or rules |
| 06 | [Learnings](primitives/learnings.md) | Immutable trade journal and compounding memory across every session | Agent makes the same mistakes indefinitely; no accountability |
| 07 | [Skills](primitives/skills.md) | Reusable instruction modules for specific recurring tasks _(coming soon)_ | Agent applies generic behaviour to tasks you've already taught it how to do |
