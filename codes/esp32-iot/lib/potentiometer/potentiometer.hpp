#pragma once

namespace potentiometer
{
    void setup();
    int readRaw();
    float readVoltage();
    float readPercentage();
}