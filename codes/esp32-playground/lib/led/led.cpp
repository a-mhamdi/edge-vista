#include "led.hpp"
#include <Arduino.h>

namespace led
{

    namespace {
        const uint8_t LED_PIN = 2;  // onboard LED on most ESP32 dev boards
        bool state = false;
    }

    void setup() {
        pinMode(LED_PIN, OUTPUT);
        digitalWrite(LED_PIN, LOW);
        state = false;
    }

    void on() {
        digitalWrite(LED_PIN, HIGH);
        state = true;
    }

    void off() {
        digitalWrite(LED_PIN, LOW);
        state = false;
    }

    void toggle() {
        state = !state;
        digitalWrite(LED_PIN, state ? HIGH : LOW);
    }

    bool isOn() {
        return state;
    }

}