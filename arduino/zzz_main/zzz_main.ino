// ---- BEGINNING OF [IOMessage.java] OUTPUT ---- //
#define MAX_MESSAGE_SIZE 32

// Client Output (9): B1-8=Current time in millis
// Client Input (9): B1-8=Echo same bytes back
#define MSG_PING 0
#define COB_PING 9
#define CIB_PING 9

// Client Output (0): [nothing]
// Client Input (2): B1=Number of Inputs ; B2=Number of Outputs
#define MSG_IO_COUNT 1
#define COB_IO_COUNT 0
#define CIB_IO_COUNT 2

// Client Output (1): B1=Output # to set ON
// Client Input (1): B1=Same byte back
#define MSG_TURNON_ONE 2
#define COB_TURNON_ONE 1
#define CIB_TURNON_ONE 1

// Client Output (1): B1=Output # to set OFF
// Client Input (1): B1=Same byte back
#define MSG_TURNOFF_ONE 3
#define COB_TURNOFF_ONE 1
#define CIB_TURNOFF_ONE 1

// Client Output (32): B1-32=Output bits, 1(turn on) 0(do not change)
// Client Input (32): B1-32 Same bytes back
#define MSG_TURNON_MANY 4
#define COB_TURNON_MANY 32
#define CIB_TURNON_MANY 32

// Client Output (32): B1-32=Output bits, 1(turn off) 0(do not change)
// Client Input (32): B1-32 Same bytes back
#define MSG_TURNOFF_MANY 5
#define COB_TURNOFF_MANY 32
#define CIB_TURNOFF_MANY 32

// Client Output (32): B1-32=Output bits, 1(turn on) 0(turn off)
// Client Input (32): B1-32 Same bytes back
#define MSG_TURNONOFF_ALL 6
#define COB_TURNONOFF_ALL 32
#define CIB_TURNONOFF_ALL 32

// Client Output (1): B1=Output # to check
// Client Input (2): B1=Output # checked, B2=0(off) 1(on)
#define MSG_CHECK_OUTPUT 7
#define COB_CHECK_OUTPUT 1
#define CIB_CHECK_OUTPUT 2

// Client Output (0): [nothing]
// Client Input (32): B1-32=Output bits, 0(off) 1(on)
#define MSG_CHECK_OUTPUTS 8
#define COB_CHECK_OUTPUTS 0
#define CIB_CHECK_OUTPUTS 32

// Client Output (1): B1=Input # to check
// Client Input (2): B1=Input # checked, B2=0(off) 1(on)
#define MSG_CHECK_INPUT 9
#define COB_CHECK_INPUT 1
#define CIB_CHECK_INPUT 2

// Client Output (0): [nothing]
// Client Input (32): B1-32=Input bits, 0(off) 1(on)
#define MSG_CHECK_INPUTS 10
#define COB_CHECK_INPUTS 0
#define CIB_CHECK_INPUTS 32



// ---- END OF [IOMessage.java] OUTPUT ---- //

#include <SPI.h>
#include <Ethernet.h>
#include <EthernetUdp.h>

// enable below to dump debugging info to serial?
#define SERIAL_DEBUG

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
    udpResponse(COB_PING);
    return;
  case MSG_IO_COUNT:
    udpBuffer[1] = numberOfInputs;
    udpBuffer[2] = numberOfOutputs;
    udpResponse(3);
    return;
  case MSG_TURNON_ONE:
    setOutputOn(udpBuffer[1]);
    udpResponse(2);
    return;
  case MSG_TURNOFF_ONE:
    setOutputOff(udpBuffer[1]);
    udpResponse(2);
    return;
    /*
    	TURNON_MANY(0x04, 32, 32, "B1-32=Output bits, 1(turn on) 0(do not change)", "B1-32 Same bytes back"),
	TURNOFF_MANY(0x05, 32, 32, "B1-32=Output bits, 1(turn off) 0(do not change)", "B1-32 Same bytes back"),
	TURNONOFF_ALL(0x06, 32, 32, "B1-32=Output bits, 1(turn on) 0(turn off)", "B1-32 Same bytes back"),
	CHECK_OUTPUT(0x07, 1, 2, "B1=Output # to check", "B1=Output # checked, B2=0(off) 1(on)"),
	CHECK_OUTPUTS(0x08, 0, 32, "[nothing]", "B1-32=Output bits, 0(off) 1(on)"),
	CHECK_INPUT(0x09, 1, 2, "B1=Input # to check", "B1=Input # checked, B2=0(off) 1(on)"),
	CHECK_INPUTS(0x0A, 0, 32, "[nothing]", "B1-32=Input bits, 0(off) 1(on)");
    */
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



























