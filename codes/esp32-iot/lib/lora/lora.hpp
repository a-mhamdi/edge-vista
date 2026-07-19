#pragma once

#include <Arduino.h>
#include <functional>

namespace lora
{
    using MessageHandler = std::function<void(const String& payload)>;

    // Initialize the LoRa radio
    void setup();

    // Must be called in loop() to check for incoming packets
    void loop();

    // Send a payload over LoRa
    void send(const String& payload);

    // Register a handler for incoming packets
    void onReceive(MessageHandler handler);
}