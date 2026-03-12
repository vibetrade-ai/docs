# Full Data Flow

How a complete autonomous Playbook run flows through all the primitives — from Heartbeat tick to executed trade. This is a real session: Aggressive Alpha, 11 March 2026.

---

## Step by step

### 1. Heartbeat — tick fires at 9:00am

Live prices fetched for SBIN, ONGC, COALINDIA. Position Monitor trigger evaluated: condition is `time`, cron `*/30 9-15 * * 1-5` — fires.

### 2. Triggers — reasoning\_job dispatched

Action type is `reasoning_job`. Agent instance started with trigger context: _"You are running the Aggressive Alpha 30-minute position monitor…"_

### 3. Playbooks — document loaded as system context

Aggressive Alpha plan injected: entry rules, exit rules, capital allocation, guardrails. Agent knows which programme it's running.

### 4. Market Tooling — agent reasons, tool calls made

Calls `get_positions`, `get_quote` for all open symbols, `compute_indicators` (5-min RSI + VWAP). Evaluates RSI deterioration, volume fade, post-1pm criteria across ONGC SHORT.

### 5. Permissions — approval card queued

Three signals fired on ONGC SHORT: RSI deterioration, recovery with elevated volume, post-1pm loss with no catalyst. Full reasoning written to approval card. User approves at 13:32.

### 6. Broker — trade placed via Market Tooling

`place_order` called: BUY 11 ONGC MARKET (close short). Order filled at ₹271.75.

### 7. Learnings — trade record written

Immutable entry created: symbol, quantity, price, Playbook ID, and the full exit reasoning at the moment of decision. Tagged to Aggressive Alpha.

---

## The full session

| Run | Time | Outcome |
|-----|------|---------|
| 1 | 9:00am | Queued ONGC exit — approved and filled |
| 2 | 9:30am | No action needed — logged |
| 3 | 10:00am | Queued exits for COALINDIA and HINDALCO |
| 4 | 10:30am | Queued 1 further approval |

Every run — whether it resulted in a trade or not — is recorded in full by [Learnings](primitives/learnings.md).
