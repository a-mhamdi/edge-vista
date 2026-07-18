"""
MQTT client setup + publish thread. Pulls (annotated_frame, detections) from result_queue, publishes detections as JSON to Mosquitto.
"""

import json
import queue
import time

import cv2
import paho.mqtt.client as mqtt

from modules import config
from modules.shared import result_queue, stop_event

def on_connect(client, userdata, flags, rc):
    if rc == 0:
        print(f"[MQTT] Connected to {config.MQTT_BROKER}:{config.MQTT_PORT}")
    elif rc == 4:
        print("[MQTT] Connection failed: bad username or password")
    elif rc == 5:
        print("[MQTT] Connection failed: not authorized (check user has publish rights)")
    else:
        print(f"[MQTT] Connection failed, rc={rc}")


def on_disconnect(client, userdata, rc):
    print(f"[MQTT] Disconnected (rc={rc})")


mqtt_client = mqtt.Client(client_id=config.MQTT_CLIENT_ID)
mqtt_client.on_connect = on_connect
mqtt_client.on_disconnect = on_disconnect

if config.MQTT_USERNAME:
    mqtt_client.username_pw_set(config.MQTT_USERNAME, config.MQTT_PASSWORD)


def mqtt_connect():
    try:
        mqtt_client.connect(config.MQTT_BROKER, config.MQTT_PORT, keepalive=30)
        mqtt_client.loop_start()  # background thread handles reconnects automatically
    except Exception as e:
        print(f"[MQTT] Could not connect: {e}")


def publish_thread():
    print(f"[Publish] Started, publishing to '{config.MQTT_TOPIC}'")
    while not stop_event.is_set():
        try:
            annotated, detections = result_queue.get(timeout=1)
        except queue.Empty:
            continue

        payload = json.dumps({
            "timestamp": time.time(),
            "count": len(detections),
            "detections": detections
        })

        try:
            mqtt_client.publish(config.MQTT_TOPIC, payload, qos=config.MQTT_QOS)
        except Exception as e:
            print(f"[MQTT] Publish failed: {e}")

        if config.SAVE_ANNOTATED:
            cv2.imwrite(config.SAVE_PATH, annotated)

    print("[Publish] Stopped")
