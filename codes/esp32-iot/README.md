# ESP32 IoT

A collection of small ESP32 modules for experimenting with different communication protocols: HTTP, WebSocket, MQTT, and LoRa. Built with PlatformIO, each protocol lives in its own namespace so modules can be tried independently or combined.

## Requirements

- [PlatformIO](https://platformio.org/) (CLI or VS Code / CLion plugin)
- ESP32 dev board
- LoRa module _(e.g. SX1276/78)_ for the `lora` example

## Dependencies

```
lib/
  wifi/
    wifi.hpp
    wifi.cpp
  rest/
    rest.hpp        # HTTP REST server
    rest.cpp
  websocket/
    websocket.hpp   # WebSocket server
    websocket.cpp
  mqtt/
    mqtt.hpp        # MQTT client (PubSubClient)
    mqtt.cpp
  lora/
    lora.hpp        # LoRa send/receive
    lora.cpp
```

Each module exposes a small public API _(e.g. `mqtt::connect()`, `mqtt::publish()`)_ with internals kept private to the `.cpp` file.

## Modules

> [!NOTE]
> All modules share the same Wi-Fi connection setup in `wifi.hpp`, except LoRa which uses its own radio link and doesn't need Wi-Fi.

- **REST (`rest.hpp`)** — simple HTTP server, exposes GET/POST endpoints for reading sensor values or triggering actions.
- **WebSocket (`websocket.hpp`)** — push-based updates to connected clients, useful for live dashboards.
- **MQTT (`mqtt.hpp`)** — publishes JSON payloads to a broker using PubSubClient; supports authenticated connections.
- **LoRa (`lora.hpp`)** — long-range, low-bandwidth send/receive, no Wi-Fi required.

## Build & flash

```bash
pio run -t upload
pio device monitor -b 115200
```

> [!IMPORTANT]
> Set Wi-Fi credentials, MQTT broker address/credentials, and LoRa pin mapping in `config.hpp` before flashing.

## Choosing a module

Each protocol has its own PlatformIO environment in `platformio.ini`. Select which one to build/flash with `-e`:

```bash
pio run -e mqtt -t upload
pio run -e lora -t upload
```

> [!TIP]
> Since each protocol is isolated in its own namespace, you can copy just the files you need (e.g. `mqtt.hpp` + `mqtt.cpp`) into another project without pulling in the rest.
