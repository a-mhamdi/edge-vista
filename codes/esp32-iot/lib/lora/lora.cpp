#include "lora.hpp"
#include "config.hpp"
#include <LoRa.h>
#include <SPI.h>

namespace lora
{
    namespace {
        MessageHandler handler = nullptr;
    }

    void setup()
    {
        LoRa.setPins(config::LORA_CS, config::LORA_RST, config::LORA_DIO0);

        if (!LoRa.begin(config::LORA_FREQUENCY))
        {
            Serial.println("LoRa init failed!");
            while (true)
            {
                delay(1000);
            }
        }

        Serial.println("LoRa initialized");
    }

    void loop()
    {
        int packetSize = LoRa.parsePacket();
        if (packetSize == 0)
        {
            return;
        }

        String payload;
        while (LoRa.available())
        {
            payload += (char)LoRa.read();
        }

        if (handler != nullptr)
        {
            handler(payload);
        }
    }

    void send(const String& payload)
    {
        LoRa.beginPacket();
        LoRa.print(payload);
        LoRa.endPacket();
    }

    void onReceive(MessageHandler h)
    {
        handler = h;
    }
}