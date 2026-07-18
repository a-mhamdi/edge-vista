"""
Pipeline: starts camera, inference, and MQTT publish threads,
and handles graceful shutdown on Ctrl+C.
"""

import signal
import threading

from modules.shared import stop_event
from modules.camera_worker import camera_thread
from modules.inference_worker import inference_thread
from modules.mqtt_worker import mqtt_connect, publish_thread, mqtt_client


def handle_sigint(signum, frame):
    print("\n[Main] Shutdown signal received")
    stop_event.set()


signal.signal(signal.SIGINT, handle_sigint)

if __name__ == "__main__":
    mqtt_connect()

    t_cam = threading.Thread(target=camera_thread, daemon=True)
    t_inf = threading.Thread(target=inference_thread, daemon=True)
    t_pub = threading.Thread(target=publish_thread, daemon=True)

    t_cam.start()
    t_inf.start()
    t_pub.start()

    t_cam.join()
    t_inf.join()
    t_pub.join()

    mqtt_client.loop_stop()
    mqtt_client.disconnect()
    print("[Main] Clean exit")
