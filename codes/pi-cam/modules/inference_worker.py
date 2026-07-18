"""
Pulls frames from frame_queue, runs YOLO11 inference, pushes
(annotated_frame, detections) onto result_queue.
"""

import cv2
import queue

from ultralytics import YOLO

from modules import config
from modules.shared import frame_queue, result_queue, stop_event

from modules.stream import update_frame, start as start_stream

# Loaded once at import time — shared read-only across calls
model = YOLO(config.MODEL_PATH, task="detect")

start_stream(port=5000)

def inference_thread():
    print(f"[Inference] Started with model {config.MODEL_PATH}")
    while not stop_event.is_set():
        try:
            frame = frame_queue.get(timeout=1)
        except queue.Empty:
            continue  # re-check stop_event instead of blocking forever

        results = model.predict(frame, conf=config.CONF_THRESHOLD, verbose=False)[0]

        detections = []
        for box in results.boxes:
            cls_id = int(box.cls[0])
            detections.append({
                "class_id": cls_id,
                "class_name": model.names[cls_id],
                "confidence": round(float(box.conf[0]), 3),
                "bbox": [round(v, 1) for v in box.xyxy[0].tolist()]
            })

        annotated = results.plot()  # boxes/labels drawn on the frame

        update_frame(annotated)

        if config.SHOW_PREVIEW:
            cv2.imshow("Preview", annotated)
            cv2.waitKey(1)

        if result_queue.full():
            try:
                result_queue.get_nowait()
            except queue.Empty:
                pass
        result_queue.put((annotated, detections))

    print("[Inference] Stopped")
