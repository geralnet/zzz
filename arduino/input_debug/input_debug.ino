// changing those constants might require changing
// variable types. Ex: selects fits in a byte in the code.
#define INPUTS    64 // number of inputs to read
#define SELECTS    6  // number of select pins
#define BYTES      8  // number of bytes to store inputs

const int pinSelect[] = { 
  8, 9, 11, 5 ,6, 7
    // INVERTED AxC
  // INVERTED DxF
};
const int pinInputRead = 14;
const int pinConfig = 12;
byte values[INPUTS];

void readAll() {
  for (byte reading = 0; reading < INPUTS; reading++) {
    for (byte selecting = 0; selecting<SELECTS; selecting++) {
      digitalWrite(pinSelect[selecting], bitRead(reading, selecting));
    }
    byte newValue = digitalRead(pinInputRead);
    if (values[reading] != newValue) {
      inputChanged(reading, values[reading], newValue);
      values[reading] = newValue;
    }
  }
}

void inputChanged(byte input, byte oldValue, byte newValue) {
  if (!digitalRead(pinConfig)) {
    Serial.print(input);
    Serial.print(": ");
    Serial.print(oldValue);
    Serial.print(" -> ");
    Serial.println(newValue);
  }
}

void setup() {
  // init serial
  Serial.begin(9600);
  // set pin mode
  for (int i=0; i < SELECTS; i++) {
    pinMode(pinSelect[i], OUTPUT);
  }
  pinMode(pinInputRead, INPUT);
  digitalWrite(pinInputRead, HIGH); //pull-up
  // read all values
  readAll();
}

void loop() {
  readAll();
  if (digitalRead(pinConfig)) {
    for (byte b=0; b<INPUTS; b++) {
      if (b % 8 == 0) Serial.print(" ");
      else if (b % 4 == 0) Serial.print(".");
      Serial.print(values[b]);
    }
    Serial.println();
  } 
}

















