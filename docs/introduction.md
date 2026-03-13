# The agentic harness for autonomous trading

> Six primitives that give an LLM everything it needs to trade on your behalf — and nothing more than you've authorised.

Vibe Trade is a **harness** — a structured environment that lets a large language model reason about markets, act on your behalf, and accumulate judgement over time, without you having to babysit it.

The core insight is that LLMs are already capable of sophisticated market reasoning. What they lack is **infrastructure**: a live connection to the market, a sense of time, a memory that persists across sessions, a monitoring loop that doesn't cost a fortune, and a trust model that ensures nothing happens without your consent. Vibe Trade supplies all of it.

The result is a trading agent you can give a strategy to in plain English — and then leave alone.

---

## The six primitives

| # | Primitive | What it gives the agent |
|---|-----------|------------------------|
| 01 | [Market Tooling](primitives/market-tooling.md) | Live data and broker execution — 20 built-in tools |
| 02 | [Heartbeat](primitives/heartbeat.md) | Always-on monitoring loop, wakes the agent only when a condition fires |
| 03 | [Triggers](primitives/triggers.md) | A condition and an action — the automation primitive |
| 04 | [Permissions](primitives/permissions.md) | Code-level approval gate with three consent modes |
| 05 | [Playbooks](primitives/playbooks.md) | Persistent strategy document loaded as context on every run |
| 06 | [Learnings](primitives/learnings.md) | Immutable trade journal and compounding memory |
| 07 | [Skills](primitives/skills.md) | Reusable instruction modules _(coming soon)_ |

---

## Quick start

→ [GitHub: vibetrade-ai/vibe-trade](https://github.com/vibetrade-ai/vibe-trade)

→ [Full example app guide](example-app.md)
