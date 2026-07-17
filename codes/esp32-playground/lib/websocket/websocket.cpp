#include "config.hpp"
#include "websocket.hpp"
#include <ESPAsyncWebServer.h>

namespace websocket
{
    namespace {
        AsyncWebServer server(config::WS_PORT);
        AsyncWebSocket ws("/pot");

        void onEvent(AsyncWebSocket* server, AsyncWebSocketClient* client,
                     AwsEventType type, void* arg, uint8_t* data, size_t len)
        {
            if (type == WS_EVT_CONNECT)
            {
                Serial.printf("WS client #%u connected\n", client->id());
            }
            else if (type == WS_EVT_DISCONNECT)
            {
                Serial.printf("WS client #%u disconnected\n", client->id());
            }
        }
    }

    void setup()
    {
        ws.onEvent(onEvent);
        server.addHandler(&ws);
        server.begin();
    }

    void broadcast(const String& payload)
    {
        ws.cleanupClients();
        ws.textAll(payload);
    }
}