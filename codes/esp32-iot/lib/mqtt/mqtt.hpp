#pragma once
#include <Arduino.h>
#include <functional>

namespace mqtt
{
    // Callback signature: topic, payload (as String)
    using MessageHandler = std::function<void(const String& topic, const String& payload)>;

    // Connect to the broker (blocking, retries until success)
    void setup();

    // Must be called every loop() to maintain the connection and process messages
    void loop();

    // Publish a JSON payload to a given topic
    void publish(const char* topic, const String& payload);

    // Subscribe to a topic and register a handler for incoming messages
    void subscribe(const char* topic, MessageHandler handler);

    // Connection status
    bool isConnected();
}