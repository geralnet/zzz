#define IOBYTES    8 // bytes used to control IOS
#define IOS       (IOBYTES*8) // number of inputs/outputs
#define SELECTS    6 // number of input-select pins

const int pinInSelect[] = { 
  8, 9, 11, 5 ,6, 7
    // INVERTED AxC
  // INVERTED DxF
};
const int pinInputRead = 14;
const int pinOutLatch = 3;
const int pinOutClock = 2;
const int pinOutData = 4;
const int pinConfig = 12;
byte values[IOS];
boolean changed = false;

boolean readAll() {
  changed = false;
  for (byte reading = 0; reading < IOS; reading++) {
    for (byte selecting = 0; selecting<SELECTS; selecting++) {
      digitalWrite(pinInSelect[selecting], bitRead(reading, selecting));
    }
    byte newValue = digitalRead(pinInputRead);
    if (values[reading] != newValue) {
      changed = true;
      inputChanged(reading, values[reading], newValue);
      values[reading] = newValue;
    }
  }
}

void inputChanged(byte input, byte oldValue, byte newValue) {
  Serial.print(input);
  Serial.print("=");
  Serial.print(newValue);
  Serial.println("!!!");
}

void setup() {
  // set pin mode
  pinMode(pinOutLatch, OUTPUT);
  pinMode(pinOutClock, OUTPUT);  
  pinMode(pinConfig, INPUT);
  for (int i=0; i < SELECTS; i++) {
    pinMode(pinInSelect[i], OUTPUT);
  }
  pinMode(pinInputRead, INPUT);
  digitalWrite(pinInputRead, HIGH); //pull-up
  pinMode(pinOutData, OUTPUT);
  digitalWrite(pinConfig, HIGH); //set pullup
}


void loop() {
  readAll();
  digitalWrite(pinOutLatch, LOW);
  for (int i=IOBYTES-1; i>=0; i--) {
    int data = 0;
    for (int j=7; j>=0; j--) {
      int index = i*8 + j;
      data <<= 1;
      data |= values[index];
    }
    shiftOut(pinOutData, pinOutClock, MSBFIRST, data);  
  }
  digitalWrite(pinOutLatch, HIGH);
}


