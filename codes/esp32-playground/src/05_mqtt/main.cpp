#include "config.hpp"
#include "led.hpp"
#include "mqtt.hpp"
#include "potentiometer.hpp"
#include "wifi.hpp"
#include <Arduino.h>

namespace
{
    unsigned long lastPublish = 0;
    constexpr unsigned long PUBLISH_INTERVAL_MS = 1000;

}

void setup()
{
    Serial.begin(115200);

    wifi::connect();
    led::setup();
    potentiometer::setup();
    mqtt::setup();

    mqtt::subscribe(config::TOPIC_LED_SET, [](const String& topic, const String& payload)
    {
        if (payload.indexOf("\"on\"") >= 0)
        {
            led::on();
        }
        else if (payload.indexOf("\"off\"") >= 0)
        {
            led::off();
        }
    });
}

void loop()
{
    mqtt::loop();

    unsigned long now = millis();
    if (now - lastPublish >= PUBLISH_INTERVAL_MS)
    {
        lastPublish = now;
        int value = potentiometer::readRaw();
        String json = "{\"pot\":" + String(value) + "}";
        mqtt::publish(config::TOPIC_POT, json);
    }
}