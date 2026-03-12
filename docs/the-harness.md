# The Harness

The word "harness" is deliberate. A harness doesn't replace the horse — it channels its capability into something controllable, directed, and safe. Vibe Trade does the same for an LLM.

An LLM on its own is powerful but directionless for trading. It has no state, no time, no broker connection, no memory of what it did yesterday, and no guardrails on what it can do next. The harness provides all of that as a set of interlocking primitives. Remove any one of them and the agent either can't act, or acts without accountability.

---

## Primitives around the core reasoner

```
┌─────────────────┐                    ┌─────────────────┐
│  Market Tooling │                    │   Permissions   │
│ live data+broker│──┐             ┌──▶│  approval gate  │
├─────────────────┤  │   ┌─────┐   │  ├─────────────────┤
│    Heartbeat    │──┼──▶│ LLM │───┤  │    Playbooks    │
│ monitoring loop │  │   └─────┘   │  │ strategy+thesis │
├─────────────────┤  │             │  ├─────────────────┤
│    Triggers     │──┘             └──▶│    Learnings    │
│   when to act   │                    │  audit+memory   │
└─────────────────┘                    └─────────────────┘
```

The LLM reasons. The harness acts, remembers, and governs.

Each primitive solves one problem an LLM cannot solve on its own. Together they form a complete agentic trading system.
