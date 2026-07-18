"""
Shared state between threads: queues + the stop signal.
Kept in one place so every worker file imports the same objects
instead of each creating its own (which would break the pipeline).
"""

import queue
import threading

frame_queue = queue.Queue(maxsize=1)
result_queue = queue.Queue(maxsize=1)
stop_event = threading.Event()
