# Offline Bot (TWS + ClickHouse)

Local version that connects to TWS desktop app and stores data in ClickHouse.

## Requirements
- TWS or IB Gateway running locally
- ClickHouse server
- Python 3.11+

## Setup (Windows with Docker)

1. Start ClickHouse and initialize database:
```powershell
powershell -ExecutionPolicy Bypass -File init_db.ps1
```

2. Configure TWS:
- Go to File -> Global Configuration -> API -> Settings
- Check "Enable ActiveX and Socket Clients"
- Uncheck "Read-Only API" (optional)
- Set Socket Port to 7497
- Add 127.0.0.1 to Trusted IPs
- Apply and OK

3. Install Python dependencies:
```bash
pip install -r requirements.txt
```

4. Copy and edit .env:
```bash
cp .env.example .env
# Edit .env with your credentials
```

5. Run:
```bash
python bot.py
```

## Setup (Mac/Linux)
```bash
brew install clickhouse
clickhouse server
```

2. Create database:
```bash
clickhouse client < sql/init/01_create_tables.sql
```

3. Install Python dependencies:
```bash
pip install -r requirements.txt
```

4. Copy and edit .env:
```bash
cp .env.example .env
nano .env
```

5. Run:
```bash
python bot.py
```

## Features
- Monitors SPY, GLD, SLV options
- Fetches IV smile data from Interactive Brokers (TWS/Gateway)
- Auto-detects TWS port (7497, 7496, 4001, 4002)
- Stores data in ClickHouse database (optional, graceful degradation if unavailable)
- Telegram bot interface for on-demand charts and alerts
- Detects arbitrage and shape anomalies in IV smile
