"""
Loads settings from .env into typed Python values.
"""

import os
from dotenv import load_dotenv

load_dotenv()

import socket

HOSTNAME = socket.gethostname()

def _bool(name: str, default: bool) -> bool:
    return os.getenv(name, str(default)).strip().lower() in ("1", "true", "yes")


# Camera
CAMERA_INDEX = int(os.getenv("CAMERA_INDEX", 0))

# Model
MODEL_PATH = os.getenv("MODEL_PATH", "yolo11n.pt")
CONF_THRESHOLD = float(os.getenv("CONF_THRESHOLD", 0.5))

# MQTT
MQTT_BROKER = os.getenv("MQTT_BROKER", "127.0.0.1")
MQTT_PORT = int(os.getenv("MQTT_PORT", 1883))
MQTT_TOPIC = f"{HOSTNAME}/" + os.getenv("MQTT_TOPIC", "edge-vista/yolo/detections")
MQTT_CLIENT_ID = os.getenv("MQTT_CLIENT_ID", "pi-yolo-cam") + f"-{HOSTNAME}"
MQTT_QOS = int(os.getenv("MQTT_QOS", 0))
MQTT_USERNAME = os.getenv("MQTT_USERNAME", "")
MQTT_PASSWORD = os.getenv("MQTT_PASSWORD", "")

# Output
SAVE_ANNOTATED = _bool("SAVE_ANNOTATED", False)
SAVE_PATH = os.getenv("SAVE_PATH", "last_frame.jpg")

# Preview
SHOW_PREVIEW = _bool("SHOW_PREVIEW", False)
