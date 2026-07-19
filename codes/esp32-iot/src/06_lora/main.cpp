#include "lora.hpp"
#include <Arduino.h>

namespace
{
    unsigned long lastSend = 0;
    constexpr unsigned long SEND_INTERVAL_MS = 3000;
}

void setup()
{
    Serial.begin(115200);
    lora::setup();

    lora::onReceive([](const String& payload)
    {
        Serial.print("Received: ");
        Serial.println(payload);
    });
}

void loop()
{
    lora::loop();

    unsigned long now = millis();
    if (now - lastSend >= SEND_INTERVAL_MS)
    {
        lastSend = now;
        lora::send("Hello from ESP32");
        Serial.println("Sent packet");
    }
}