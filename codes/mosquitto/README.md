# Mosquitto

MQTT broker (Eclipse Mosquitto) with MQTT (`1883`) and WebSocket (`9001`) listeners, password-protected.

```bash
docker compose up -d
```

> [!IMPORTANT]
> Create the `passwd` file first with `mosquitto_passwd -c passwd <user>`. Anonymous access is disabled.
