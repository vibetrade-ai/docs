# Vibe Trade App

A local chat interface and automation harness that puts all six primitives in your hands — the fastest way to understand what these docs describe in practice.

Vibe Trade is a fully-featured AI trading agent built on the harness described in this documentation. Every primitive — Heartbeat, Triggers, Permissions, Playbooks, Learnings — is wired up and running. Install it, connect your Dhan account, and the full harness is live.

It's designed as an **experience** first. Talk to the agent, watch it reason in real time, approve or reject its trade suggestions, create Playbooks through conversation, and inspect every decision and the reasoning behind it.

---

## Install and run

```bash
# Install globally via npm
npm install -g vibe-trade

# Start the app
vibetrade
```

```
✓ VibeTrade running at http://localhost:3001
  Click http://localhost:3001 if it doesn't open automatically
```

The browser opens automatically. Add your Anthropic API key and Dhan credentials at `http://localhost:3001/settings`.

The app runs entirely on your machine. Your API key, credentials, trade history, and Playbooks are stored in `~/.vibetrade/` and never leave your local environment.

---

## What you can do with it

**Talk to your portfolio** — Ask the agent what's in your positions, how they're performing, what the market is doing. It has 20 live tools via [Market Tooling](primitives/market-tooling.md) — real prices, candles, indicators, order book, news.

**Create Playbooks in chat** — Describe your strategy in plain English. The agent helps you shape it into a structured [Playbook](primitives/playbooks.md) — entry rules, exit criteria, capital allocation, guardrails — then runs it autonomously from that point forward.

**Watch triggers fire** — The [Heartbeat](primitives/heartbeat.md) loop runs in the background every 30 seconds. When a condition fires, you see it — and if it spawns a reasoning job, you see the agent's full thought process.

**Approve trades in real time** — Every trade recommendation arrives as a structured approval card with the exact order and every signal that led to it. One click to approve or reject. See [Permissions](primitives/permissions.md).

**Review the trade journal** — Every decision, every reasoning trace, every outcome — logged and browsable by Playbook or time. See [Learnings](primitives/learnings.md).

**Configure without code** — Triggers, Playbooks, and consent modes are all managed through the UI or through conversation.

---

## Requirements

| Dependency | Notes |
|------------|-------|
| Node.js ≥ 20 | The app runs as a local Node process |
| Anthropic API key | Claude Sonnet for reasoning jobs, Haiku for condition evaluation |
| Dhan account | First supported broker — credentials added at `/settings` after install |

---

> **Start with chat before automation.** The app is most useful as a live conversation partner first. Ask the agent to look at your positions, fetch a quote, or explain a stock's technicals. Once you're comfortable with how it reasons and what tools it has, give it a Playbook and let it run autonomously.
