#include "config.hpp"
#include "mqtt.hpp"
#include "wifi.hpp"
#include <PubSubClient.h>
#include <WiFi.h>
#include <map>

namespace mqtt
{
    namespace {
        WiFiClient wifiClient;
        PubSubClient client(wifiClient);
        std::map<String, MessageHandler> handlers;

        void onMessage(char* topic, uint8_t* payload, unsigned int length)
        {
            String topicStr = String(topic);
            String payloadStr;
            payloadStr.reserve(length);
            for (unsigned int i = 0; i < length; i++)
            {
                payloadStr += (char)payload[i];
            }

            auto it = handlers.find(topicStr);
            if (it != handlers.end())
            {
                it->second(topicStr, payloadStr);
            }
        }

        void resubscribeAll()
        {
            for (auto const& entry : handlers)
            {
                client.subscribe(entry.first.c_str());
            }
        }

        void reconnect()
        {
            while (!client.connected())
            {
                // If WiFi itself dropped, re-establish it before retrying MQTT
                wifi::reconnect();

                Serial.print("Connecting to MQTT broker...");

                bool ok = client.connect(
                    config::MQTT_CLIENT_ID,
                    config::MQTT_USER,
                    config::MQTT_PASSWORD
                );

                if (ok)
                {
                    Serial.println(" connected");
                    resubscribeAll();
                }
                else
                {
                    Serial.print(" failed, rc=");
                    Serial.print(client.state());
                    Serial.println(" retrying in 2s");
                    delay(2000);
                }
            }
        }
    }

    void setup()
    {
        client.setServer(config::MQTT_BROKER, config::MQTT_PORT);
        client.setCallback(onMessage);
        reconnect();
    }

    void loop()
    {
        if (!client.connected())
        {
            reconnect();
        }
        client.loop();
    }

    void publish(const char* topic, const String& payload)
    {
        client.publish(topic, payload.c_str());
    }

    void subscribe(const char* topic, MessageHandler handler)
    {
        handlers[String(topic)] = handler;
        if (client.connected())
        {
            client.subscribe(topic);
        }
    }

    bool isConnected()
    {
        return client.connected();
    }
}