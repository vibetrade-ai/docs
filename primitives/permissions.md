# Permissions

> The trust primitive — a code-level approval gate that ensures no money moves without recorded consent.

Giving an AI access to your trading account is a meaningful act of trust. The obvious failure mode is an agent that acts on your money without your knowledge. But there's a subtler failure mode: an agent that _asks_ for permission in chat, you say "yes", and that's treated as authorisation. That's gameable, ambiguous, and not a real record of consent.

**The core principle: no trade can be placed without explicit, recorded consent.** What consent looks like depends on how much autonomy you've chosen to give the agent.

---

## The approval gate

Every `reasoning_job` that wants to place a trade must submit a request to the approval gate. The agent cannot bypass this. Even when it has concluded a trade is the right move, it can only queue the request — not execute it.

The request arrives as a structured approval card: the exact trade, the full reasoning behind it, and the context that led to the decision.

### A real approval card

Here is a real card from a live session — the agent's recommendation to exit a short ONGC position:

```
APPROVAL REQUEST · Aggressive Alpha — Position Monitor

Trade:   SELL · ONGC · 11 shares · MARKET · Close SHORT
Entry:   ₹269.00   LTP: ₹271.75   Unrealised: −₹30.25

🔴 EXIT SIGNAL — 3 SIGNALS FIRED

SIGNAL 1 — RSI DETERIORATION
RSI has risen to 56.52, crossing the 55 ceiling for short momentum.
The downside thesis is losing steam — buyers are stepping in.

SIGNAL 2 — RECOVERY WITH ELEVATED VOLUME
Last two candles (179K, 260K) showed high-volume bouncing action.
Price recovering from ₹271.2 back to ₹271.75. A SHORT needs sellers
in control; this shows the opposite.

SIGNAL 3 — POST-1PM LOSS WITH NO CATALYST
It is 13:30 IST. Position is at −1.02% with no news driving ONGC
lower. Hard SL at ₹273.04 is only ₹1.29 away. Holding risks a −1.5%
loss; exiting now limits damage to −1.02%.

RECOMMENDATION: Exit now. Saves ~₹5.30/share vs hitting the hard SL.

[ ✓ Approve ]  [ ✗ Reject ]
```

This is not a chat confirmation. It is a timestamped, structured record — linked to the Playbook, the trigger that fired, and the agent's reasoning at the moment of decision.

---

## Three levels of consent

### In-chat execution

You're in a live conversation and ask the agent to act. Even so, it raises a formal approval card — not a chat reply. The gate is always present, even in active sessions.

### Async approval

A trigger fires while you're away from your desk. The agent queues the approval and waits. Mobile delivery — WhatsApp, Telegram — is on the roadmap, so you can approve or reject from your phone without opening the app.

### Autonomous execution

Available only within a Playbook, with explicit guardrails defined upfront: maximum capital, maximum loss, circuit-breakers like _"if two stop-losses hit today, halt all new entries."_ Consent was given when you set the rules. The agent operates within that mandate and cannot exceed it.

---

## hard\_order and the pre-authorisation model

Some triggers bypass the approval queue entirely. A `hard_order` trigger — used for stop-losses and price targets — executes the moment its condition is met, with no agent involvement and no approval step. This is by design: a stop-loss that waits for your phone tap is not a stop-loss.

The consent for a `hard_order` is given when you create the trigger. The execution is the fulfilment of a decision you already made.

| Consent type | When given | Where recorded |
|-------------|------------|----------------|
| Trade-level | At execution time — per trade | Approval queue — Approve / Reject |
| Trigger-level | When the hard\_order trigger is created | Trigger record — condition + tradeArgs |
| Autonomous | When Playbook guardrails are defined | Playbook document — mandate boundaries |
