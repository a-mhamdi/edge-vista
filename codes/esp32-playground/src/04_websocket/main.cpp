#include "potentiometer.hpp"
#include "websocket.hpp"
#include "wifi.hpp"
#include <Arduino.h>

namespace
{
    unsigned long lastSend = 0;
    constexpr unsigned long SEND_INTERVAL_MS = 500;
}

void setup()
{
    Serial.begin(115200);

    wifi::connect();
    potentiometer::setup();
    websocket::setup();
}

void loop()
{
    unsigned long now = millis();
    if (now - lastSend >= SEND_INTERVAL_MS)
    {
        lastSend = now;
        int value = potentiometer::readRaw();
        String json = "{\"pot\":" + String(value) + "}";
        websocket::broadcast(json);
    }
}

// npx wscat -c ws://ESP_IP:81/pot