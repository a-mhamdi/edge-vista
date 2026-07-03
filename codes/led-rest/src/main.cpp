/*
 * RESTful LED control on ESP32
 *
 * Endpoints:
 *   GET  /led/status  -> {"state":"on"}  or  {"state":"off"}
 *   POST /led         -> body: {"state":"on"}  or  {"state":"off"}
 */

#include <Arduino.h>
#include <WiFi.h>
#include <ESPAsyncWebServer.h>

const char* ssid     = "TT_09B8";
const char* password = "gsoih3o2ng";

const int LED_PIN = 4;
bool ledState = false;

AsyncWebServer server(80);

void setup() {
  Serial.begin(115200);
  pinMode(LED_PIN, OUTPUT);
  digitalWrite(LED_PIN, LOW);

  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED) {
    delay(300);
    Serial.print(".");
  }
  Serial.println();
  Serial.print("IP address: ");
  Serial.println(WiFi.localIP());

  // GET /led/status
  server.on("/led/status", HTTP_GET, [](AsyncWebServerRequest *request) {
    String json = "{\"state\":\"" + String(ledState ? "on" : "off") + "\"}";
    request->send(200, "application/json", json);
  });

  // POST /led  { "state": "on" | "off" }
  server.on("/led", HTTP_POST,
    [](AsyncWebServerRequest *request) {},          // no-op, body handled below
    NULL,
    [](AsyncWebServerRequest *request, uint8_t *data, size_t len, size_t index, size_t total) {
      String body = String((char*)data).substring(0, len);

      if (body.indexOf("\"on\"") >= 0) {
        ledState = true;
      } else if (body.indexOf("\"off\"") >= 0) {
        ledState = false;
      } else {
        request->send(400, "application/json", "{\"error\":\"invalid state\"}");
        return;
      }

      digitalWrite(LED_PIN, ledState ? HIGH : LOW);
      String json = "{\"state\":\"" + String(ledState ? "on" : "off") + "\"}";
      request->send(200, "application/json", json);
    });

  server.begin();
}

void loop() {
  // Nothing needed here — ESPAsyncWebServer runs in the background.
}
