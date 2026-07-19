#include "potentiometer.hpp"
#include <Arduino.h>

void setup() {
    Serial.begin(115200);

    potentiometer::setup();

    Serial.println();
    Serial.println("=== Potentiometer Test ===");
}

void loop() {
    int raw = potentiometer::readRaw();
    float voltage = potentiometer::readVoltage();
    float percentage = potentiometer::readPercentage();

    Serial.printf(
        "Raw: %4d | Voltage: %.2f V | Percentage: %6.2f %%\n",
        raw,
        voltage,
        percentage
    );

    delay(200);
}
