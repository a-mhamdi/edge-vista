#include "led.hpp"
#include <Arduino.h>

void setup() {
    Serial.begin(115200);

    led::setup();

    Serial.println();
    Serial.println("=== LED Test ===");
}

void loop() {
    led::toggle();

    Serial.print("LED is ");
    Serial.println(led::isOn() ? "ON" : "OFF");

    delay(1000);
}
