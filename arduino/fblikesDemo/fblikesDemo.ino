#include <TM1638.h>
// define a module on data pin 8, clock pin 7 and strobe pin 6
TM1638 module(8, 7, 6);

static unsigned long num = 0;
static unsigned long display_num = 0;

void setup() {
  Serial.begin(57600);
  // Display number 1 with no dots set and no leading zeros 
  module.setDisplayToDecNumber(1, 0, false); 
}

void loop() {
  if (Serial.available()) {
    int ch = Serial.read();
    if (ch >= '0' && ch <= '9')  num = num * 10 + (ch - 0x30);
    if (ch == '.') {
      display_num = (num < 100000000) ? num : num % 100000000;
      module.setDisplayToDecNumber(display_num, 0, false);        
      num = 0; 
    }
  }   
}
