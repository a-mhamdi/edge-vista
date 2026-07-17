#include "wifi.hpp"
#include <Arduino.h>
#include <WiFi.h>

#include "config.hpp"

namespace wifi
{
    void connect() {
        Serial.printf("Connecting to %s", config::WIFI_SSID);
        WiFi.mode(WIFI_STA);
        WiFi.begin(config::WIFI_SSID, config::WIFI_PASSWORD);
        while (WiFi.status() != WL_CONNECTED) {
            delay(500);
            Serial.print(".");
        }
        Serial.println();
        Serial.println("Connected!");
        Serial.print("IP address: ");
        Serial.println(WiFi.localIP());
    }

    bool isConnected() {
        return WiFi.status() == WL_CONNECTED;
    }

    void reconnect() {
        if (!isConnected())
            connect();
    }
}
