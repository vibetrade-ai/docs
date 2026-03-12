# Triggers

> The automation primitive — every autonomous action the agent takes originates from a trigger.

A trigger is a condition and an action. When the condition becomes true, the action fires. There are no separate concepts called "schedules" or "reminders" — a cron expression is just a time-based condition, and everything resolves to the same two questions: _when should this run?_ and _what should happen when it does?_

---

## Anatomy of a trigger

Every trigger has the same shape. Here is a real stop-loss trigger from a live intraday session:

```json
{
  "id": "2da93e8b-59c1-4493-ab64-685840048aeb",
  "name": "HINDALCO Short — Stop Loss ₹964",
  "scope": "symbol",
  "watchSymbols": ["HINDALCO"],

  "condition": {
    "mode": "code",
    "expression": "quotes['HINDALCO'].lastPrice >= 964"
  },

  "action": {
    "type": "hard_order",
    "tradeArgs": {
      "symbol": "HINDALCO",
      "transaction_type": "BUY",
      "quantity": 3,
      "order_type": "MARKET"
    }
  },

  "expiresAt": "2026-03-11T15:15:00+05:30",
  "context": "Stop loss for intraday short. Entry SHORT 3 shares @ ₹957.95. Cover if price hits ₹964.",
  "status": "active"
}
```

---

## Condition modes

| Mode | When it fires | Typical use |
|------|--------------|-------------|
| `code` | When a JavaScript expression evaluates to `true` against the live snapshot | Stop-loss, price targets, drawdown guards |
| `event` | When a named system event occurs | Position opened/closed, index move threshold |
| `time` | On a cron schedule | Morning scans, position monitors, EOD closes |
| `llm` | When Haiku answers "yes" to a natural language question | Instinct-based conditions not expressible as a formula |

---

## Action types

| Type | What happens | Agent involved? | Typical use |
|------|-------------|:---------------:|-------------|
| `hard_order` | Trade executes immediately in pure code — no reasoning, no approval queue | No | Stop-losses, price targets, EOD hard closes |
| `reasoning_job` | Agent wakes up with trigger context and Playbook loaded, reasons, may queue approvals | Yes | Morning scans, position monitors, re-entry decisions |

{% hint style="info" %}
**hard\_order vs reasoning\_job:** A stop-loss that fires a `reasoning_job` will wait for the agent to wake up, reason, and queue an approval. A stop-loss that fires a `hard_order` executes the moment the price condition is met. For hard guardrails, use `hard_order`. For anything requiring judgement, use `reasoning_job`.
{% endhint %}

---

## A real trigger stack — Aggressive Alpha

The full trigger architecture the agent built for itself when running the Aggressive Alpha intraday Playbook:

| Trigger | Condition | Action | Scope |
|---------|-----------|--------|-------|
| Alpha SL — HINDALCO | `code` — price ≥ ₹964 | hard\_order BUY 3 MARKET | symbol |
| Alpha Target — HINDALCO | `code` — price ≤ ₹948 | hard\_order BUY 3 MARKET | symbol |
| Alpha Trail — HINDALCO | `code` — price ≤ ₹938 (+2% move) | reasoning\_job — move SL to breakeven | symbol |
| Nifty Drop Guard | `event` — nifty\_drop\_percent ≥ 1% | reasoning\_job — review all longs | market |
| Nifty Spike Guard | `event` — nifty\_rise\_percent ≥ 1% | reasoning\_job — review all shorts | market |
| Re-entry Scanner | `event` — position\_closed | reasoning\_job — find next setup | portfolio |
| Correlated Drawdown Guard | `code` — 2+ positions losing >0.75% simultaneously | reasoning\_job — review exposure | portfolio |
| Time Stop Review | `code` — any position <0.5% move after 90 min | reasoning\_job — evaluate dead weight | portfolio |
| Position Monitor | `time` — every 30 min, 9:20am–3:10pm | reasoning\_job — VWAP, RSI, volume check | portfolio |
| EOD Hard Close | `time` — 3:10pm daily | reasoning\_job — close all positions | portfolio |

The agent registered all of these itself. You described the strategy. The agent built the automation stack.
