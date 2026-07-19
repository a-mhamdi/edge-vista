/*
 * Single-shot capture server on ESP32-CAM (AI-Thinker)
 * Exposes GET /capture -> returns one JPEG frame per request
 */


#include "camera.hpp"
#include "http_server.hpp"
#include "wifi.hpp"
#include <Arduino.h>

void setup() {
    Serial.begin(115200);

    wifi::connect();

    if (!camera::init()) {
        return;
    }

    http_server::start();
}

void loop() {
    delay(10); // server runs in background via esp_http_server
}
