#pragma once

#include <cstdint>

namespace config
{
    constexpr char WIFI_SSID[]     = "<SSID>";
    constexpr char WIFI_PASSWORD[] = "<PASSWORD>";

    const int SERVER_PORT = 80;
    const int WS_PORT     = 81;

    constexpr const char* MQTT_BROKER    = "<BROKER_IP>";
    constexpr uint16_t    MQTT_PORT      = 1883;
    constexpr const char* MQTT_USER      = "user";
    constexpr const char* MQTT_PASSWORD  = "password";
    constexpr const char* MQTT_CLIENT_ID = "esp32-playground";
    constexpr const char* TOPIC_LED_SET  = "edge-vista/led/set";
    constexpr const char* TOPIC_POT      = "edge-vista/pot";

    constexpr char DEVICE_NAME[] = "esp32-playground";
}
