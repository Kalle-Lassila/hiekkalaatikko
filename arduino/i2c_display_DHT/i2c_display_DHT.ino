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
void print_display(void);

void setup(void) {
    Serial.begin(115200);
    Serial.print("jep\n");
    Wire.begin();
    DHT.begin();

    u8g2.begin();
    u8g2.setDisplayRotation(U8G2_R2);
}

void loop(void) {
    int status = DHT.read();
    float humidity = DHT.getHumidity();
    float temperature = DHT.getTemperature();
    Serial.print("\n");
    Serial.print("Humidity:\n");
    Serial.print(humidity, 1);
    Serial.print("\n");
    Serial.print("Temperature:\n");
    Serial.print(temperature, 1);
    Serial.print("\n");

    u8g2.clearBuffer();                   // clear the internal memory
    u8g2.setFont(u8g2_font_ncenB08_tr);   // choose a suitable font

    char temp_str[6];
    char hum_str[6];

    dtostrf(temperature, 5, 2, temp_str);
    dtostrf(humidity, 5, 1, hum_str);

    char temperature_line[20];
    char humidity_line[20];

    snprintf(temperature_line, 20, "Temperature: %s", temp_str);
    snprintf(humidity_line, 20, "Humidity: %s", hum_str);
    Serial.print(temperature_line);
    Serial.print("\n");
    Serial.print(humidity_line);
    Serial.print("\n");

    u8g2.drawStr(0, 10, temperature_line);
    u8g2.drawStr(0, 20, humidity_line);
    u8g2.sendBuffer();

    delay(3000);  
}

void print_display(void){

}