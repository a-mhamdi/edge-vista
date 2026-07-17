#include "led.hpp"
#include "rest.hpp"
#include "wifi.hpp"
#include <Arduino.h>


void setup() {
    Serial.begin(115200);

    wifi::connect();
    led::setup();
    rest::setup();
}

void loop() {
    // AsyncWebServer runs independently
}
