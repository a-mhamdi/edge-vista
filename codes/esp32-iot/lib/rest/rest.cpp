#include "config.hpp"
#include "rest.hpp"
#include "led.hpp"
#include <ESPAsyncWebServer.h>


namespace rest
{
    namespace {
        AsyncWebServer server(config::SERVER_PORT);
    }

    void setup()
    {

        // POST /led  { "state": "on" | "off" }
        server.on("/led", HTTP_POST,
            [](AsyncWebServerRequest *request) {},   // no-op, body handled below
            NULL,
            [](AsyncWebServerRequest *request, uint8_t *data, size_t len, size_t index, size_t total)
            {
                String body = String((char*)data).substring(0, len);

                if (body.indexOf("\"on\"") >= 0)
                {
                    led::on();
                }
                else if (body.indexOf("\"off\"") >= 0)
                {
                    led::off();
                }
                else
                {
                    request->send(400, "application/json", "{\"error\":\"invalid state\"}");
                    return;
                }

                String json = "{\"state\":\"" + String(led::isOn() ? "on" : "off") + "\"}";
                request->send(200, "application/json", json);
            });

        // GET /led/status
        server.on("/led/status", HTTP_GET, [](AsyncWebServerRequest *request)
        {
            String json = "{\"led\":\"" + String(led::isOn() ? "on" : "off") + "\"}";
            request->send(200, "application/json", json);
        });

        server.begin();
    }
}
