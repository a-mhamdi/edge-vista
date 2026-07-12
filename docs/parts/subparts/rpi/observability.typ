#import "../../../common.typ": *

=== Node Exporter

#topic[What it does]

- Runs as a lightweight agent on the host _(bare metal, VM, or Pi)_
- Exposes hardware and OS metrics _(CPU, memory, disk, network, filesystem)_ over HTTP
- Default endpoint: `http://<host>:9100/metrics`
- Metrics are pulled by Prometheus on a scrape interval, not pushed

#v(1em)

#topic[Why it matters here]

- Standard building block for infrastructure monitoring
- Runs as a `systemd` service on each Pi/host
- Feeds directly into a Prometheus + Grafana stack for dashboards

---

#topic[Deployment Flow]

#align(center)[
  #box(
    stroke: teal-color,
    radius: 4pt,
    inset: 10pt,
    fill: teal-light,
  )[Download binary → `/usr/local/bin`]\
  #text(fill: teal-color)[↓]\
  #box(
    stroke: teal-color,
    radius: 4pt,
    inset: 10pt,
    fill: teal-light,
  )[Create dedicated system user]\
  #text(fill: teal-color)[↓]\
  #box(
    stroke: teal-color,
    radius: 4pt,
    inset: 10pt,
    fill: teal-light,
  )[Enable via `systemd` unit]\
  #text(fill: teal-color)[↓]\
  #box(
    stroke: teal-color,
    radius: 4pt,
    inset: 10pt,
    fill: teal-light,
  )[Scraped by Prometheus → visualized in Grafana]\
  #text(fill: teal-color)[↓]\
  #box(
    stroke: teal-color,
    radius: 4pt,
    inset: 10pt,
    fill: teal-light,
  )[Visualized in Grafana]
]

#v(1em)
#text(size: 14pt, style: "italic")[
  #star Same pattern extends to custom Python/Julia exporters for sensor data.
]

---

#topic[Setup Commands]

*1. Download the binary*

```bash
  cd /tmp
  wget https://github.com/prometheus/node_exporter/releases/download/v1.11.1/node_exporter-1.11.1.linux-armv7.tar.gz
  tar xvf node_exporter-1.11.1.linux-armv7.tar.gz
  sudo mv node_exporter-1.11.1.linux-armv7/node_exporter /usr/local/bin/
```

---

*2. Create the dedicated user*

#url-block("codes/observability/node-exporter.service")

```bash
  sudo useradd --no-create-home --shell /bin/false node_exporter
```

*3. Activate the service*

```bash
  sudo systemctl daemon-reload
  sudo systemctl enable --now node_exporter
  sudo systemctl status node_exporter
```

---

=== Prometheus

- Time-series database purpose-built for metrics
- Pulls _(scrapes)_ data from exporters on a configurable interval
- Stores everything locally with its own query language, PromQL
- *Config-driven:* targets defined in `prometheus.yml`

#v(1em)

#align(center)[#image("../../../assets/prom-arch.svg", width: 70%)]

---

#topic[The `prometheus.yml` Config File]

- Single `YAML` file drives all of Prometheus's behavior
- Three main sections: `global`, `scrape_configs`, and _(optionally)_ `rule_files`/`alerting`
- Mounted read-only into the container at `/etc/prometheus/prometheus.yml`

#v(0.8em)

#url-block("codes/observability/prometheus/prometheus.yml")

#v(0.5em)
#important[
  Add one entry per host under `targets` to monitor multiple Pis/machines.
]

---

#topic[How They Fit Together]

#v(1em)

#align(center)[
  #box(
    stroke: teal-color,
    radius: 4pt,
    inset: 10pt,
    fill: teal-light,
  )[Exporters expose metrics \ _(e.g. `node_exporter` on `:9100`)_]\
  #text(fill: teal-color)[↓ scrape]\
  #box(
    stroke: teal-color,
    radius: 4pt,
    inset: 10pt,
    fill: teal-light,
  )[Prometheus \ stores time-series data]\
  #text(fill: teal-color)[↓ query _(PromQL)_]\
  #box(
    stroke: teal-color,
    radius: 4pt,
    inset: 10pt,
    fill: teal-light,
  )[Grafana \ dashboards & alerts]
]
#url-block("codes/observability/compose.yml")

---

=== Grafana

- Visualization layer on top of Prometheus _(and many other data sources)_
- Dashboards, alerts, panels#footnote[No coding required to build a view]
- Talks to Prometheus over HTTP using PromQL under the hood

#align(center)[#image("../../../assets/grafana.png", width: 95%)]


#topic[Getting Dashboards Fast]

Grafana dashboards can be built manually panel-by-panel, or imported instantly from the community library

#v(1em)

- In Grafana: *Dashboards → Import*
- Enter ID `1860`

#align(center)[
  #box(
    stroke: teal-color + 2pt,
    radius: 6pt,
    inset: 16pt,
    fill: teal-light,
  )[
    #text(weight: "bold", fill: teal-color)[
      Dashboard ID: 1860
    ]
    #v(0.3em)
    Node Exporter Full
  ]
]

- Select your Prometheus data source
- Full host metrics view out of the box#footnote[Install `stress-ng` to generate CPU load]
