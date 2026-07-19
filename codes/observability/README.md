# Observability Stack

Prometheus + Grafana monitoring for the Pi fleet, plus the Node Exporter systemd unit deployed on each Pi.

## Contents

| File | Purpose |
|---|---|
| `compose.yml` | Docker Compose stack: Prometheus (`:9090`) + Grafana (`:3000`) |
| `prometheus/prometheus.yml` | Scrape config — targets `node_exporter` on the Pi fleet |
| `node_exporter.service` | systemd unit to run `node_exporter` on a Pi |

## Usage

```bash
docker compose up -d
```

- *Grafana:* `http://localhost:3000` (default login `admin` / `admin`)
- *Prometheus:* `http://localhost:9090`

> [!IMPORTANT]
> Update the `node_exporter` target IP(s) in `prometheus/prometheus.yml` to match the Pi fleet.
