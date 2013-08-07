/*
If configuration pin is set (LOW), will blink all at once.
 Else, will activate one by one.
 
 Please check our main reference for this idea:
 http://arduino.cc/en/Tutorial/ShftOut11
 */

const int pinLatch = 8;
const int pinClock = 9;
const int pinData = 7;
const int pinConfig = 6;

void setup() {
  Serial.begin(9600);
  pinMode(pinLatch, OUTPUT);
  pinMode(pinClock, OUTPUT);  
  pinMode(pinData, OUTPUT);
  pinMode(pinConfig, INPUT);
  digitalWrite(pinConfig, HIGH); //set pullup
}

unsigned int last = 0;

void loop() {
  if (digitalRead(pinConfig)) {
    // not config (active low)
    blinkAll();
  } 
  else {
    // config mode (active low)
    oneByOne();
  }
}

void blinkAll() {
  Serial.print("Blink All: ");
  unsigned int data;
  if (last) {
    Serial.println("off");
    data = 0x00;
  } 
  else {
    Serial.println("on");
    data = 0xFF;
  }
  digitalWrite(pinLatch, LOW);
  shiftOut(pinData, pinClock, MSBFIRST, data);  
  shiftOut(pinData, pinClock, MSBFIRST, data);  
  shiftOut(pinData, pinClock, MSBFIRST, data);  
  shiftOut(pinData, pinClock, MSBFIRST, data);  
  digitalWrite(pinLatch, HIGH);
  last = !last;
  delay(1000);
}

void oneByOne() {
  last++;
  if (last >= 64) last = 0;
  Serial.print("One by One: ");
  Serial.print(last);
  unsigned int a = 1 << last;
  unsigned int b = (last >= 8) ? (1 << (last - 8)) : 0;
  unsigned int c = (last >= 16) ? (1 << (last - 16)) : 0;
  unsigned int d = (last >= 24) ? (1 << (last - 24)) : 0;
  Serial.print("=");
  Serial.print(a);
  Serial.print(",");
  Serial.print(b);
  Serial.print(",");
  Serial.print(c);
  Serial.print(",");
  Serial.println(d);
  digitalWrite(pinLatch, LOW);
  shiftOut(pinData, pinClock, MSBFIRST, d);  
  shiftOut(pinData, pinClock, MSBFIRST, c);  
  shiftOut(pinData, pinClock, MSBFIRST, b);  
  shiftOut(pinData, pinClock, MSBFIRST, a);  
  digitalWrite(pinLatch, HIGH);
  delay(50);
}









