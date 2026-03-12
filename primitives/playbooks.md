# Playbooks

> The agent's operating manual — a written strategy document that anchors every decision made on its behalf.

Every new LLM session starts from zero. Without a Playbook, ask the agent whether to buy Infosys today, close the tab, ask again tomorrow — and you might get a different answer. One instance looks at volatility and says wait. Another looks at fundamentals and says buy. Neither is wrong, but neither is _yours_. There's no consistent thesis, no discipline, no record of what you were trying to achieve.

**A Playbook is the document that fixes this.** It is a written strategy that the agent receives as context on every run — whether triggered by a schedule, a price condition, or a live chat. The agent reasons as: _"I am running this Playbook. These are my rules. Given what I can see right now, here is what I should do."_

---

## What a Playbook contains

A Playbook is a markdown document. There is no rigid schema — you write it the way you'd brief a portfolio manager. In practice, effective Playbooks cover four things:

| Section | What it captures | Example |
|---------|-----------------|---------|
| Investment thesis | Why you're trading this and what you believe | "Maximise intraday P\&L by keeping capital deployed across 3 slots, trading momentum/breakout setups on liquid Nifty 100 stocks in both directions" |
| Rules and constraints | What the agent must and must not do | "No new entries after 2:30 PM. Skip entry if balance < ₹2,000. VIX > 22: use tighter SL parameters" |
| Entry and exit approach | How the agent identifies and sizes trades | "LONG: price above VWAP, RSI 45–65, breaking above opening range high. Quantity = slot capital / price, round down" |
| Capital allocation | How much is deployed and how it's split | "Slot A: ₹3,000 · Slot B: ₹3,000 · Slot C: ₹2,500 · Reserve: ₹500 (never deployed)" |

You don't write this from scratch. You describe your intent in plain English, the agent helps you shape it into a document, and once you agree — it becomes the operating manual.

---

## What a Playbook adds

| Feature | |
|---------|-|
| Consistent agent identity | Every trigger and schedule tied to this Playbook loads the same document. The agent always knows which programme it's running. |
| Isolated P\&L tracking | Trades tagged to a Playbook are tracked separately. You can see exactly how a thesis is performing over time. |
| Capital allocation bounds | The Playbook specifies what's allocated. The agent reasons within those bounds and won't exceed them. |
| Playbook state | The agent reads and updates state — `scanning`, `paused`, `position_open` — so each run picks up where the last one left off. |
| Scoped Learnings | Observations and lessons are tagged to the Playbook they came from. Performance review is always in context of the specific thesis. |

---

## Playbook record

The actual record for Aggressive Alpha — the live intraday strategy used throughout these docs:

```json
{
  "id": "84f56962-0f6b-4d71-b1ec-4c9721f88fdb",
  "name": "Aggressive Alpha",
  "description": "Aggressive intraday long/short momentum strategy trading up to 3 concurrent positions across Nifty 100 stocks, always keeping capital deployed.",
  "allocation": 9000,
  "state": "scanning",
  "status": "active",
  "plan": "## Aggressive Alpha — Intraday Long/Short Momentum Strategy\n\n...",
  "createdAt": "2026-03-10T17:09:16.796Z",
  "updatedAt": "2026-03-11T07:31:15.671Z"
}
```

The `state` field is written by the agent at the end of each run. Each subsequent run picks up from it — no context is lost between sessions.
