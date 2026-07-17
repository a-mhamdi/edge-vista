#include "potentiometer.hpp"
#include <Arduino.h>

namespace potentiometer {

    namespace {
        const uint8_t POT_PIN = 34;   // ADC1 channel, input-only pin
        const float V_REF = 3.3f;
        const int ADC_MAX = 4095;     // 12-bit resolution
    }

    void setup() {
        analogReadResolution(12);
        pinMode(POT_PIN, INPUT);
    }

    int readRaw() {
        return analogRead(POT_PIN);
    }

    float readVoltage() {
        return (readRaw() / static_cast<float>(ADC_MAX)) * V_REF;
    }

    float readPercentage() {
        return (readRaw() / static_cast<float>(ADC_MAX)) * 100.0f;
    }

}