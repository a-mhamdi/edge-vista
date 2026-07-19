"""
ESP32-CAM capture tool: repeated single-shot captures
"""

import os
import time
import requests
from flask import Flask, jsonify

from modules import config

app = Flask(__name__)

PAGE = """
<!DOCTYPE html>
<html>
<head>
    <title>ESP32-CAM Capture Tool</title>
    <style>
        body {{ font-family: sans-serif; background: #111; color: #eee; text-align: center; padding: 2rem; }}
        img {{ max-width: 640px; border: 2px solid #0f766e; border-radius: 8px; }}
        button {{ font-size: 1.2rem; padding: 0.7rem 2rem; margin-top: 1.5rem;
                  background: #0f766e; color: white; border: none; border-radius: 6px; cursor: pointer; }}
        button:active {{ background: #0b5c56; }}
        #status {{ margin-top: 1rem; font-size: 1rem; color: #aaa; }}
        #count {{ font-weight: bold; color: #0f766e; }}
    </style>
</head>
<body>
    <h2>ESP32-CAM &rarr; Data Collection</h2>
    <img id="preview" src="{capture_url}">
    <br>
    <button onclick="capture()">Save Current Frame</button>

    <div id="status">Ready</div>
    <br>
    <div>Saved: <span id="count">0</span> images</div>
    <div id="error" style="color:red;"></div>

    <script>
        let count = 0;

        // Repeated single-shot requests to `/capture` on the ESP32.
        setInterval(() => {{
            document.getElementById('preview').src = '{capture_url}?t=' + Date.now();
        }}, {interval_ms});

        async function capture() {{
            document.getElementById('status').innerText = 'Saving...';
            try {{
                const res = await fetch('/save', {{ method: 'POST' }});
                const data = await res.json();
                if (data.ok) {{
                    count++;
                    document.getElementById('count').innerText = count;
                    document.getElementById('status').innerText = 'Last saved: ' + data.filename;
                }} else {{
                    document.getElementById('error').innerText = 'Error: ' + data.error;
                }}
            }} catch (e) {{
                document.getElementById('error').innerText = 'Error: ' + e;
            }}
        }}
    </script>
</body>
</html>
"""

@app.route("/")
def index():
    return PAGE.format(capture_url=config.CAPTURE_URL, interval_ms=config.PREVIEW_INTERVAL_MS)

@app.route("/save", methods=["POST"])
def save():
    try:
        os.makedirs(config.SAVE_DIR, exist_ok=True)
        resp = requests.get(config.CAPTURE_URL, timeout=5)
        resp.raise_for_status()
        timestamp = time.strftime("%Y%m%d_%H%M%S")
        filename = f"{config.LABEL_PREFIX}_{timestamp}.jpg"
        filepath = os.path.join(config.SAVE_DIR, filename)
        with open(filepath, "wb") as f:
            f.write(resp.content)
        return jsonify(ok=True, filename=filename, path=filepath)
    except Exception as e:
        return jsonify(ok=False, error=str(e)), 500

def run_capture_tool():
    print(f"Saving captures to: {os.path.abspath(config.SAVE_DIR)}")
    print(f"ESP32-CAM capture endpoint: {config.CAPTURE_URL}")
    app.run(host="0.0.0.0", port=config.APP_PORT, debug=False)
