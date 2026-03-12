# Heartbeat

> Continuous market monitoring without continuous LLM inference — a lightweight loop that wakes the agent only when something matters.

Keeping an LLM running 24/7 is prohibitively expensive. But trading conditions don't wait — a stock might hit your entry price at 2:15pm on a Tuesday, and if nothing is watching, the moment passes. **Heartbeat decouples monitoring from reasoning.** A cheap process watches constantly. The LLM only runs when a condition fires.

---

## The tick

Heartbeat runs on a fixed interval — every 30 seconds during market hours, slower when the market is closed. On each tick:

**1. Build a dynamic snapshot**

Fetch live prices for every symbol currently held and every symbol referenced in an active trigger. Not the whole market — just what's being watched. The scope adjusts automatically as your positions and triggers change.

**2. Evaluate all active triggers**

Check every trigger condition against the snapshot. Code conditions are evaluated in pure JavaScript — no LLM, no cost. LLM conditions are sent to a lightweight model (Haiku) with a single yes/no question.

**3. Wake the agent — or stand down**

If a condition fired: spin up the main agent with the full snapshot and Playbook context. If nothing fired: no LLM call, no cost. Quiet tick until the next interval.

---

## Evaluation cost by condition type

| Condition mode | Evaluated by | Cost per tick | Example |
|---------------|:------------:|:-------------:|---------|
| `code` | JavaScript | Near zero | `quotes['HINDALCO'].lastPrice >= 964` |
| `event` | System listener | Zero | `position_opened`, `nifty_drop_percent` |
| `time` | Cron scheduler | Zero | `20 9 * * 1-5` — weekdays at 9:20am |
| `llm` | Haiku (yes/no) | Minimal | "Is any open position showing unusual movement?" |

The `llm` condition mode is what makes Heartbeat qualitatively different from a traditional rules engine. The agent can set instinct-based triggers — not just coded equations — and the cost of monitoring them stays negligible.
