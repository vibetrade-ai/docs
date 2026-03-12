# Example App

A local chat interface that puts all six primitives in your hands — the fastest way to understand what the harness actually does.

The Vibe Trade example app is a fully-featured chat application that connects to the same primitives described in these docs. Every concept here — Heartbeat, Triggers, Permissions, Playbooks, Learnings — is wired up and ready to use. Install it, connect your Dhan account, and the harness is live.

It's designed as an **experience** first. You can talk to the agent, watch it reason in real time, approve or reject its trade suggestions, create Playbooks through conversation, and inspect everything it has done and why.

---

## Install and run

```bash
# Install globally via npm
npm install -g vibe-trade

# Run the app
vibe-trade start
```

```
✓ Vibe Trade running at http://localhost:3000
✓ Heartbeat loop      waiting for market open
✓ Storage             ~/.vibe-trade/db.json
  Connect your Dhan account at http://localhost:3000/settings
```

The app runs entirely on your machine. Your Anthropic API key, your Dhan credentials, your trade history, your Playbooks — none of it leaves your local environment.

---

## What you can do with it

**Talk to your portfolio** — Ask the agent what's in your positions, how they're performing, what the market is doing. It has live access to everything via [Market Tooling](primitives/market-tooling.md).

**Create Playbooks in chat** — Describe your strategy. The agent helps you shape it into a structured [Playbook](primitives/playbooks.md), then runs it autonomously from that point forward.

**Watch triggers fire** — The [Heartbeat](primitives/heartbeat.md) loop runs in the background. When a condition fires, you see it — and if it's a reasoning job, you see the agent's full thought process.

**Approve trades in real time** — Every trade recommendation arrives as a structured approval card with full reasoning. One click to approve or reject. See [Permissions](primitives/permissions.md).

**Review the trade journal** — Every decision, every reasoning trace, every outcome — logged and browsable by Playbook or time. See [Learnings](primitives/learnings.md).

**Configure without code** — Triggers, Playbooks, and permissions are all managed through the UI or through conversation.

---

## Requirements

| Dependency | Notes |
|------------|-------|
| Node.js ≥ 18 | The app runs as a local Node process |
| Anthropic API key | Powers the agent — Claude Sonnet for reasoning jobs, Haiku for condition evaluation |
| Dhan account | First supported broker — credentials added at `/settings` after install |

---

> **Note:** **Start with chat before automation.** The example app is most useful as a live conversation partner first. Ask the agent to look at your positions, fetch a quote, or explain a stock's technicals. Once you're comfortable with how it reasons and what tools it has, you'll be better placed to give it a Playbook and let it run autonomously.
