#pragma once
#include <Arduino.h>

namespace websocket
{
    void setup();
    void broadcast(const String& payload);
}