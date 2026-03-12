# How Primitives Connect

The six primitives aren't independent modules — they compose into a single runtime loop. Here is the path for an autonomous Playbook run:

---

## The runtime loop

```
Heartbeat → Market snapshot → Trigger fires → Playbook loaded
    → LLM reasons → Permissions gate → Trade placed
```

[Learnings](primitives/learnings.md) records every step as a side-effect — including runs where no trade is placed.

---

## What each primitive contributes

| Primitive | Role in the loop | Without it |
|-----------|-----------------|------------|
| [Market Tooling](primitives/market-tooling.md) | Gives the agent live data and the ability to execute | Agent reasons in the dark; can't act on the market |
| [Heartbeat](primitives/heartbeat.md) | Monitors conditions cheaply; wakes the agent only when something fires | Either runs 24/7 (expensive) or misses time-sensitive triggers |
| [Triggers](primitives/triggers.md) | Defines when and why the agent wakes up — time, price, or event | Agent runs once and is forgotten; nothing is automated |
| [Permissions](primitives/permissions.md) | Code-level gate before every trade; records every decision | Agent acts without consent; no audit trail |
| [Playbooks](primitives/playbooks.md) | Loads the strategy document as context on every agent run | Every session starts from zero; no consistent identity or rules |
| [Learnings](primitives/learnings.md) | Logs every action with reasoning; compounds edge over time | Agent makes the same mistakes indefinitely; no accountability |
