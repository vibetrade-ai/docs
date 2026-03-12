# Skills

> **Warning:** **Coming soon.** Skills are actively being built. The architecture is designed for them — the Playbook context window already supports additional instruction modules.

> Reusable instruction modules that personalise how the agent behaves for specific tasks — loaded when relevant, ignored when not.

A [Playbook](playbooks.md) defines what you're trying to achieve. A Skill defines _how_ you like a specific recurring task done. Where a Playbook is the strategy, a Skill is the technique.

If you have a particular way of sizing positions, a checklist you run before entering a momentum trade, or a preference for how exit reasoning gets presented — that's a Skill. You write it once, and the agent reaches for it whenever that task comes up.

---

## What a Skill looks like

A Skill is a markdown file: a name, a description the agent uses to decide when to reach for it, and the instruction content. The format is identical to Claude's skill files — intentionally familiar.

```markdown
---
name: position-sizing
description: How I calculate position size for intraday trades. Use this
             whenever you need to determine quantity for a new entry.
---

Always size by risk, not by capital.

1. Determine the stop-loss distance in rupees (entry price - SL price for longs)
2. Risk per trade = 1% of available capital
3. Quantity = risk per trade / stop-loss distance, rounded down
4. Minimum 1 share. If quantity rounds to 0, skip the trade.
5. Never exceed 25% of available capital in a single position.

For intraday trades, always use INTRADAY product type. Never CNC.
```

The `description` field is what the agent reads to decide whether to reach for this Skill. Write it the way you'd explain to someone _when_ this instruction applies, not just what it contains.

---

## How Skills are loaded

| Context | Which Skills are available |
|---------|---------------------------|
| Live chat | All Skills in your library — the agent can reach for any of them freely |
| Playbook run (trigger or schedule) | Only Skills attached to that Playbook — clean isolation between strategies |

This mirrors how Skills work in Claude Code: you configure which Skills are available per project, and the model decides when they're relevant. Attach Skills to a Playbook the way you load Skills into a project.
