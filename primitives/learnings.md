# Learnings

> The agent's audit trail and compounding memory — an immutable record of every trade, every decision, and everything distilled from both.

LLMs don't naturally remember what they did. Ask an agent why it bought a stock last Tuesday and it may confabulate a reason, or simply not know. This is a foundational problem when AI is acting on your money: you need a ground truth it can't rewrite.

Beyond accountability, there's a compounding problem: without a record of what worked and what didn't, the agent makes the same mistakes indefinitely. **Learnings solves both.**

---

## The trade journal

Every order placed through Vibe Trade is written to an immutable trade record. Each entry captures what happened, when, and — critically — why the agent decided to act.

```json
[
  {
    "id": "6b2029a0-81e1-443f-85cd-e9f377182391",
    "symbol": "ONGC",
    "transactionType": "SELL",
    "quantity": 11,
    "executedPrice": 269.00,
    "status": "filled",
    "strategyId": "84f56962-0f6b-4d71-b1ec-4c9721f88fdb",
    "note": "Aggressive Alpha — Slot B SHORT. Below VWAP all session, RSI 45 falling, MACD negative, weak oil sector on bearish day. SL: ₹273.04, Target: ₹262.28",
    "filledAt": "2026-03-11 10:19:12"
  },
  {
    "id": "0c616b25-8f1b-4ea1-a2b8-4ddf3c4e0621",
    "symbol": "COALINDIA",
    "transactionType": "BUY",
    "quantity": 5,
    "executedPrice": 446.90,
    "status": "filled",
    "strategyId": "84f56962-0f6b-4d71-b1ec-4c9721f88fdb",
    "note": "Aggressive Alpha — Slot C LONG. Gapped up at open, holding above VWAP, RSI 56 with room to run, MACD positive. SL: ₹440.00, Target: ₹457.77",
    "filledAt": "2026-03-11 10:19:14"
  }
]
```

The `note` field is written by the agent at the moment of entry — the reasoning it used to make the decision, not a post-hoc summary. Every trade is auditable back to the exact thesis the agent was running at the time.

---

## Playbook-level vs. global

Every record is tagged. Trades, trigger runs, and observations are all linked to the Playbook they belong to — or marked global if they weren't part of one.

**Playbook-scoped:** Did the strategy stay true to its rules? Where did it overtrade? Where did it miss entries? All answerable by filtering to the Playbook's history.

**Global observations:** Patterns that apply across all Playbooks — market-wide timing, instrument behaviour, model tendencies. Cross-strategy insights live here separately.

---

## Compounding edge

At the end of each trading day, the agent reviews its history — reading through the trades placed, the reasoning written at the time, and the outcomes — and distils learnings from that review. A learning might propose tightening an entry condition, adjusting a rebalancing cadence, or flagging a pattern the agent kept getting wrong. Proposed changes require your approval; the agent does not edit the Playbook unilaterally.

{% hint style="warning" %}
**End-of-day distillation is coming soon.** The trade journal and audit trail are live today. The automated end-of-day review loop — where the agent reads its history and surfaces proposed learnings — is actively being built.
{% endhint %}
