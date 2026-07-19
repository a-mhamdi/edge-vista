# ESP32-CAM Data Collection Tool

Firmware + companion app to pull images from an ESP32-CAM over Wi-Fi for building an Edge Impulse training dataset.

- **Firmware**: PlatformIO project, exposes `GET /capture` on the ESP32-CAM.
- **App**: Flask app (Python), managed with `uv`, polls/fetches from `/capture` and saves images locally.

## Requirements

- [PlatformIO](https://platformio.org/)
- [uv](https://docs.astral.sh/uv/) for the Python environment
- ESP32-CAM (AI-Thinker) + USB-serial adapter _(e.g. ESP32-CAM-MB)_

## Firmware setup

```bash
pio run -t upload
pio device monitor -b 115200
```

> [!IMPORTANT]
> Set your Wi-Fi credentials and `SERVER_PORT` in `config.hpp` before flashing.

Once flashed and connected, the board serves:

```
GET http://<esp32-cam-ip>/capture   → image/jpeg
```

> [!TIP]
> If serial output isn't showing the board's IP, scan the network instead:
> ```bash
> sudo nmap -p 80 --open 192.168.1.0/24
> ```

## Python app setup

```bash
uv sync
uv run main.py
```

> [!NOTE]
> The Python environment is fully reproducible thanks to `uv` — `uv sync` reads `pyproject.toml` / `uv.lock` and rebuilds an identical environment on any machine, no manual `pip install` needed.

## Usage

1. Flash the firmware and note the ESP32-CAM's IP address.
2. Set that IP in the Flask app's config (e.g. `ESP32_IP`).
3. Run the Flask app; each request to its capture endpoint fetches a fresh frame from `/capture` and saves it to disk for later Edge Impulse upload.
