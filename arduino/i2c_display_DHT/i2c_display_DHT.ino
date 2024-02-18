#include <Arduino.h>
#include <U8g2lib.h>

#ifdef U8X8_HAVE_HW_SPI
#include <SPI.h>
#endif
#ifdef U8X8_HAVE_HW_I2C
#include <Wire.h>
#endif
#include "DHT20.h"

DHT20 DHT;

U8G2_SSD1306_128X64_NONAME_F_HW_I2C u8g2(U8G2_R0, /* clock=*/ SCL, /* data=*/ SDA, /* reset=*/ U8X8_PIN_NONE);  // High speed I2C

// U8G2_SSD1306_128X64_NONAME_F_SW_I2C u8g2(U8G2_R0, /* clock=*/ SCL, /* data=*/ SDA, /* reset=*/ U8X8_PIN_NONE);    //Low spped I2C

void setup(void) {
    Serial.begin(9600);
    Wire.begin();
    DHT.begin();
    
    u8g2.begin();
    u8g2.setDisplayRotation(U8G2_R2);
}

void loop(void) {
    int status = DHT.read();
    float humidity = DHT.getHumidity();
    float temperature = DHT.getTemperature();
    Serial.print(humidity, 1);
    Serial.print("\n");
    Serial.print(temperature, 1);
    Serial.print("\n");
    u8g2.clearBuffer();                   // clear the internal memory
    u8g2.setFont(u8g2_font_ncenB08_tr);   // choose a suitable font
    //u8g2.drawStr(0,10,"Hello World!");    // write something to the internal memory
    char temp_str[6];
    dtostrf(temperature, 4, 1, temp_str);
    u8g2.drawStr(0, 10, temp_str);
    u8g2.sendBuffer();                    // transfer internal memory to the display

    switch (status)
    {
      case DHT20_OK:
        Serial.print("OK");
        break;
      case DHT20_ERROR_CHECKSUM:
        Serial.print("Checksum error");
        break;
      case DHT20_ERROR_CONNECT:
        Serial.print("Connect error");
        break;
      case DHT20_MISSING_BYTES:
        Serial.print("Missing bytes");
        break;
      case DHT20_ERROR_BYTES_ALL_ZERO:
        Serial.print("All bytes read zero");
        break;
      case DHT20_ERROR_READ_TIMEOUT:
        Serial.print("Read time out");
        break;
      case DHT20_ERROR_LASTREAD:
        Serial.print("Error read too fast");
        break;
      default:
        Serial.print("Unknown error");
        break;
    }
    Serial.print("\n");
    delay(1000);  
    }