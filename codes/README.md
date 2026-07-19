# Edge Vista Codes

We cover here: data flows, monitoring, edge inference, and communication protocols.

## Structure

```
anomaly-detection/   # FFT/PSD-based anomaly detection examples
ansible/             # Provisioning/config management playbooks
edge-impulse/        # Edge Impulse project(s) and training data tooling
esp32-cam/           # ESP32-CAM firmware + Flask data collection app
esp32-iot/           # ESP32 playground: HTTP, WebSocket, MQTT, LoRa modules
influxdb/            # InfluxDB setup and demo flows
mosquitto/           # MQTT broker (Docker, WebSocket support)
nodered/             # Node-RED demo flows
observability/       # Prometheus + Grafana + Node Exporter monitoring
pi-cam/              # Raspberry Pi edge AI pipeline (YOLO11 + MQTT)
```

> [!NOTE]
> Each folder is self-contained with its own README covering setup and usage specific to that component.

## Orientation

- **Edge inference**: `esp32-cam/`, `pi-cam/`, `edge-impulse/`
- **Messaging & data flow**: `mosquitto/`, `nodered/`, `influxdb/`
- **Firmware experiments**: `esp32-iot/`
- **Infrastructure & monitoring**: `ansible/`, `observability/`
- **Signal processing**: `anomaly-detection/`

> [!TIP]
> Each session lists its own requirements and build/run steps.
