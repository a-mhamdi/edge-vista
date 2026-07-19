import os

import dotenv
dotenv.load_dotenv()

APP_PORT = os.getenv("APP_PORT")

ESP32_IP = os.getenv("ESP32_IP")
ENDPOINT = os.getenv("ENDPOINT")
CAPTURE_URL = f"http://{ESP32_IP}/{ENDPOINT}"

SAVE_DIR = os.getenv("SAVE_DIR")
LABEL_PREFIX = os.getenv("LABEL_PREFIX")
PREVIEW_INTERVAL_MS = os.getenv("PREVIEW_INTERVAL_MS")
