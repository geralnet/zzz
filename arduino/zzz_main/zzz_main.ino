#include <SPI.h>
#include <Ethernet.h>
#include <EthernetUdp.h>

// dump debugging info to serial?
// #define SERIAL_DEBUG

// use IOMessage.java to generate code below
#define MAX_MESSAGE_SIZE 9
#define MSG_PING 0 // Ping (pong) with 8 bytes
#define MSGSIZE_PING 9
#define MSG_IO_COUNT 1 // Get (send) number of inputs and outputs
#define MSGSIZE_IO_COUNT 3
#define MSG_SET_OUTPUT_ON 2 // Set (confirm) the status of output X to ON
#define MSGSIZE_SET_OUTPUT_ON 2
#define MSG_SET_OUTPUT_OFF 3 // Set (confirm) the status of output X to OFF
#define MSGSIZE_SET_OUTPUT_OFF 2
#define MSG_SWITCH_OUTPUT 4 // Switch (confirm) the status of output X
#define MSGSIZE_SWITCH_OUTPUT 2


// MAC address found on the back of your ethernet arduino/shield
byte mac[] = {  
  0x00, 0xAA, 0xBB, 0xCC, 0xDE, 0x02
};

const unsigned int udpPort = 0x7A5A; // ASCII for 'zZ'
const byte numberOfInputs = 64;
const byte numberOfOutputs = 64;
const byte pinLatch = 3;
const byte pinClock = 2;
const byte pinData = 4;
const byte pinConfig = 12;

byte inputBytes;
byte outputBytes;
byte* bufferOutput;
byte udpBuffer[MAX_MESSAGE_SIZE];
boolean changedOutput;
EthernetUDP udp;


#ifdef SERIAL_DEBUG
void debugln(char* str) {
  Serial.print(millis());
  Serial.print(" ");
  Serial.println(str);
}
void debug(char* str) {
  Serial.print(millis());
  Serial.print(" ");
  Serial.print(str);
}
#else
void debugln(char* str) {
}
void debug(char* str) {
}
#endif

void setup() {
  //setup pins
  pinMode(pinLatch, OUTPUT);
  pinMode(pinClock, OUTPUT);  
  pinMode(pinData, OUTPUT);
  pinMode(pinConfig, INPUT);
  digitalWrite(pinConfig, HIGH); //set pullup
  // init serial
#ifdef SERIAL_DEBUG
  Serial.begin(9600);
  while (!Serial); // wait for serial port to connect. Needed for Leonardo only
#endif
  debugln("Started");

  //calculate data
  debugln("[SET]");
  inputBytes = numberOfInputs / 8;
  if (numberOfInputs % 8 > 0) inputBytes++;
  outputBytes = numberOfOutputs / 8;
  if (numberOfOutputs % 8 > 0) outputBytes++;
  bufferOutput = (byte*)malloc(outputBytes);
  for (int i=0; i<outputBytes; i++) bufferOutput[i] = 0;
  changedOutput = true;
#ifdef SERIAL_DEBUG
  Serial.print("inputs n=");
  Serial.print(numberOfInputs);
  Serial.print(" b=");
  Serial.println(inputBytes);
  debugln("[SET]");
#endif


  // get IP address
  debugln("Get IP");
  while (Ethernet.begin(mac) == 0) {
    debugln("fail");
    delay(1000);
    debugln("Get IP");
  }
#ifdef SERIAL_DEBUG
  debug("IP: ");
  for (byte b = 0; b < 4; b++) {
    Serial.print(Ethernet.localIP()[b], DEC);
    if (b < 3) Serial.print("."); 
  }
  Serial.println();
#endif

#ifdef SERIAL_DEBUG
  debug("UDP Port: ");
  Serial.println(udpPort);
#endif
  udp.begin(udpPort);
}

void readUDP() {
  int packetSize = udp.parsePacket();
  if (packetSize == 0) return; // nothing to read
#ifdef SERIAL_DEBUG
  debug("UDP[");
  Serial.print(packetSize);
  Serial.print("] ");
  IPAddress remote = udp.remoteIP();
  for (byte b = 0; b < 4; b++) {
    Serial.print(remote[b], DEC);
    if (b < 3) Serial.print("."); 
  }
  Serial.print(":");
  Serial.println(udp.remotePort());
#endif
  if (packetSize > MAX_MESSAGE_SIZE) {
    while (udp.available()) {
      debugln("discarded");
      for (int i=0; i<packetSize; i++) { 
        udp.read(); 
      }
      return;
    }
  }
  // valid, read it
  udp.read(udpBuffer, MAX_MESSAGE_SIZE);
#ifdef SERIAL_DEBUG
  debug("< ");
  for (byte b = 0; b < packetSize; b++) {
    Serial.print(' ');
    if (udpBuffer[b] < 0x10) Serial.print('0');
    Serial.print(udpBuffer[b], HEX);
  }
  Serial.println();
#endif

  udpReceived();
}

void udpResponse(int bytes) {
#ifdef SERIAL_DEBUG
  debug("> ");
  for (byte b = 0; b < bytes; b++) {
    Serial.print(' ');
    if (udpBuffer[b] < 0x10) Serial.print('0');
    Serial.print(udpBuffer[b], HEX);
  }
  Serial.println();
#endif
  udp.beginPacket(udp.remoteIP(), udp.remotePort());
  udp.write(udpBuffer, bytes);
  udp.endPacket();
}

void udpReceived() {
  // check message type
  switch (udpBuffer[0]) {
  case MSG_PING:
    udpResponse(MSGSIZE_PING);
    return;
  case MSG_IO_COUNT:
    udpBuffer[1] = numberOfInputs;
    udpBuffer[2] = numberOfOutputs;
    udpResponse(3);
    return;
  case MSG_SET_OUTPUT_ON:
    setOutputOn(udpBuffer[1]);
    udpResponse(2);
    return;
  case MSG_SET_OUTPUT_OFF:
    setOutputOff(udpBuffer[1]);
    udpResponse(2);
    return;
  }
  debugln("msgerr");
}

void setOutputOn(byte output) {
  byte outByte = output / 8;
  byte outBit = output % 8;
  byte from = bufferOutput[outByte];
  byte mask = 1 << outBit;
  byte to = from | mask;
  if (to != from) {
    bufferOutput[outByte] = to;
    changedOutput = true;
  }
#ifdef SERIAL_DEBUG
  debug("OUT-ON: ");
  Serial.print(output);
  Serial.print(" (");
  Serial.print(outByte);
  Serial.print('.');
  Serial.print(outBit);
  Serial.print(") ");
  Serial.print(from);
  Serial.print(" | ");
  Serial.print(mask);
  Serial.print(" = ");
  Serial.println(to);
#endif
}
void setOutputOff(byte output) {
  byte outByte = output / 8;
  byte outBit = output % 8;
  byte from = bufferOutput[outByte];
  byte mask = ~(1 << outBit);
  byte to = from & mask;
  if (to != from) {
    bufferOutput[outByte] = to;
    changedOutput = true;
  }
#ifdef SERIAL_DEBUG
  debug("OUT-OFF: ");
  Serial.print(output);
  Serial.print(" (");
  Serial.print(outByte);
  Serial.print('.');
  Serial.print(outBit);
  Serial.print(") ");
  Serial.print(from);
  Serial.print(" & ");
  Serial.print(mask);
  Serial.print(" = ");
  Serial.println(to);
#endif
}

void writeOutputs() {
  if (!changedOutput) return;
  changedOutput = false;
  digitalWrite(pinLatch, LOW);
  for (byte b = outputBytes; b > 0; b--) {
    shiftOut(pinData, pinClock, MSBFIRST, bufferOutput[b-1]);  
  }
  digitalWrite(pinLatch, HIGH);
}

void loop() {
  // read inputs (as fast as possible)
  readUDP(); // read one packet at a time
  writeOutputs(); // write outputs (as needed)
}



























