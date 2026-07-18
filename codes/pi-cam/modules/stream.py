from flask import Flask, Response
import threading
import cv2

app = Flask(__name__)
_latest_frame = None
_lock = threading.Lock()

def update_frame(frame):
    global _latest_frame
    with _lock:
        _latest_frame = frame.copy()

def _generate():
    while True:
        with _lock:
            if _latest_frame is None:
                continue
            ok, buffer = cv2.imencode(".jpg", _latest_frame)
        if not ok:
            continue
        yield (b"--frame\r\n"
               b"Content-Type: image/jpeg\r\n\r\n" + buffer.tobytes() + b"\r\n")

@app.route("/stream")
def stream():
    return Response(_generate(), mimetype="multipart/x-mixed-replace; boundary=frame")

def start(port=5000):
    threading.Thread(target=lambda: app.run(host="0.0.0.0", port=port, threaded=True), daemon=True).start()
