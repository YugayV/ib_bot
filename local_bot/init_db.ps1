# Start ClickHouse container
Write-Host "Starting ClickHouse..."
docker compose up -d

# Wait for ClickHouse to be ready
Write-Host "Waiting for ClickHouse to start (10 seconds)..."
Start-Sleep -Seconds 10

# Initialize database schema
Write-Host "Initializing database schema..."
Get-Content sql/init/01_create_tables.sql | docker exec -i clickhouse-server clickhouse-client

Write-Host "ClickHouse is ready!"
