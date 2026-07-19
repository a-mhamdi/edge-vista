# InfluxDB

Docker Compose setup for InfluxDB 2, used as the time-series store for edge sensor/telemetry data.

To spin up an InfluxDB 2 container (`:8086`), run:

```bash
docker compose up -d
```

> [!NOTE]
> Data and config persist in `./data` and `./config`.
