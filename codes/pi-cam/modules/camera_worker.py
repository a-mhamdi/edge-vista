"""
Reads frames from the USB camera and pushes the freshest one onto frame_queue.
"""

import queue

import cv2

from modules import config
from modules.shared import frame_queue, stop_event


def camera_thread():
    cap = cv2.VideoCapture(config.CAMERA_INDEX)
    if not cap.isOpened():
        print("[Camera] FAIL: could not open camera")
        stop_event.set()
        return

    print(f"[Camera] Started on index {config.CAMERA_INDEX}")
    while not stop_event.is_set():
        ret, frame = cap.read()
        if not ret:
            print("[Camera] Warning: dropped frame")
            continue

        # keep only the freshest frame — drop stale one if queue is full
        if frame_queue.full():
            try:
                frame_queue.get_nowait()
            except queue.Empty:
                pass
        frame_queue.put(frame)

    cap.release()
    print("[Camera] Stopped")
