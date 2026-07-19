#include <Arduino.h>

void setup()
{
    Serial.begin(115200);

    delay(1000);

    Serial.println();
    Serial.println("================================");
    Serial.println("       Edge-Vista Project");
    Serial.println("       ESP32 Playground");
    Serial.println("================================");
    Serial.println();

    Serial.println("Ready to explore:");
    Serial.println();
    Serial.println("[1] GPIO / LED");
    Serial.println("[2] REST API");
    Serial.println("[3] Analog sensors");
    Serial.println("[4] WebSocket");
    Serial.println("[5] MQTT");
    Serial.println("[6] LoRa");
    Serial.println();

    Serial.println("Select an example from:");
    Serial.println("examples/");
    Serial.println();
}

void loop()
{
    static uint32_t counter = 0;

    Serial.print("ESP32 alive - uptime: ");
    Serial.print(counter++);
    Serial.println(" s");

    delay(1000);
}