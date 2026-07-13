#pragma once

namespace config
{

    // Wi-Fi credentials
    constexpr char WIFI_SSID[] = "THE_WIFI_SSID";
    constexpr char WIFI_PASSWORD[] = "THE_WIFI_PASSWORD";


    // MQTT configuration
    constexpr char MQTT_BROKER[] = "192.168.1.100";
    constexpr uint16_t MQTT_PORT = 1883;

    constexpr char MQTT_CLIENT_ID[] = "esp32-playground";


    // MQTT topics
    constexpr char MQTT_TOPIC_LED[] = "edge-vista/led";
    constexpr char MQTT_TOPIC_POT[] = "edge-vista/potentiometer";


    // LoRa configuration
    constexpr long LORA_FREQUENCY = 868E6;   // Europe/Tunisia
    constexpr uint8_t LORA_SYNC_WORD = 0xF3;

}