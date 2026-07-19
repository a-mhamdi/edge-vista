# Edge AI pipeline for Raspberry Pi

Runs YOLO11 inference on camera frames and publishes detections over MQTT.

## Requirements

- Raspberry Pi 4/5
- USB webcam
- [uv](https://docs.astral.sh/uv/) for the Python environment
- MQTT broker (see `mosquitto/`)

## Setup

```bash
uv sync
```

> [!NOTE]
> `pyproject.toml` is set up to resolve CPU-only PyTorch wheels correctly on both x86_64 (laptop) and aarch64 (Pi), so `uv sync` works the same on either target.

## Run

```bash
uv run main.py
```

This starts:
- a capture thread reading frames from the webcam
- an inference thread running YOLO11 (Ultralytics)
- a publisher thread sending JSON detections to the MQTT broker

## Config

Set broker address, credentials, and camera device in `.env` before running.

> [!TIP]
> If the webcam isn't detected, check `/dev/video*` — USB power/enumeration issues are common on the Pi.
