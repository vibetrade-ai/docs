# Market Tooling

> The bridge between the LLM and the market — the agent never reasons from stale training data.

An LLM's training data has a cutoff. It doesn't know today's price of SBIN, whether Nifty is up or down, what news broke this morning, or what positions you currently hold. Market Tooling fixes this by giving the agent **20 built-in tools** that connect it to live market data and your broker — so every decision it makes is grounded in what's actually happening right now.

---

## Broker tools

Vibe Trade ships with first-class support for **Dhan**. Additional brokers are on the roadmap. The API endpoints, request structures, and parsing logic are already handled. The agent calls plain-English actions; the primitive handles the broker-specific implementation.

> **Note:** **Why maintained integrations matter:** Broker APIs change. Dhan moved from V1 to V2 — naive code generation, even from strong models, will sometimes call the wrong endpoint. Market Tooling maintains these integrations so tool calls don't silently fail.

| Tool | What it does | Approval required |
|------|-------------|:-----------------:|
| `get_quote` | Live price for one or more NSE equities or ETFs | — |
| `get_index_quote` | Live price for any NSE index via IDX\_I segment | — |
| `get_positions` | Current open positions with unrealised P\&L | — |
| `get_funds` | Available margin and cash balance | — |
| `get_orders` | Pending and filled orders for the session | — |
| `place_order` | Place a buy or sell order — equity or ETF | **Yes** |
| `cancel_order` | Cancel a pending order by order ID | **Yes** |

---

## Market data tools

| Tool | What it does |
|------|-------------|
| `get_historical_data` | OHLCV candles for equities, ETFs, and indices across any timeframe |
| `compute_indicators` | RSI, MACD, Bollinger Bands, SMA, EMA, ATR — computed from live OHLCV |
| `get_fundamentals` | P/E, EPS, market cap, revenue — stocks only, via Yahoo Finance |
| `get_etf_info` | Fund family, expense ratio, top 10 holdings, sector weights — ETFs only |
| `fetch_news` | Latest market news from LiveMint RSS |
| `get_market_status` | Whether the market is currently open or closed |
| `is_trading_day` | Whether a given date is an NSE trading day |
| `get_upcoming_holidays` | NSE holiday calendar |
| `search_instruments` | Search for equities or ETFs by name or symbol |
| `get_top_movers` | Top gainers and losers for any Nifty index |
| `get_market_depth` | Level 2 order book — bids and offers with quantities |
| `get_index_constituents` | All stocks in any NSE index with symbol, name, and industry |
| `compare_stocks` | Side-by-side comparison of equities or indices across key metrics |

---

## Extensibility

The built-in tools cover the most common data needs, but every trader has their own edge — a proprietary screener, an internal backtesting engine, a Bloomberg terminal. Vibe Trade will support registering custom tools by defining an endpoint, credentials, and a capability description the agent can read.

> **Warning:** **Coming soon.** Custom tool registration is on the roadmap. Once available, any data source or capability you can describe can be added to the agent's toolkit.
