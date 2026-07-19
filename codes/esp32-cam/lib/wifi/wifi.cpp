#include "config.hpp"
#include "wifi.hpp"
#include <Arduino.h>
#include <WiFi.h>

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
        Serial.print("Capture ready at: http://");
        Serial.print(WiFi.localIP());
        Serial.println(config::ENDPOINT);

    }

    bool isConnected() {
        return WiFi.status() == WL_CONNECTED;
    }

    void reconnect() {
        if (!isConnected())
            connect();
    }
}
