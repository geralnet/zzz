
// *** DISCLAIMER ***
// This program is provided from http://www.geral.net/zzz/ , if you got it
// somewhere else you may have an outdated version. Any authoring, licensing and
// acknolegments information is explained further in that website.

// TODO Ideas
// Change the char* strings, enclosing with the F() macro to reduce RAM usage.

/* check
 http://forum.arduino.cc/index.php?topic=86504.0
 pinMode(4,OUTPUT);
 digitalWrite(4,HIGH);
 */

















////////////////////////////////////////////////////////////////////////////////
//                                                                            //
// MESSAGE CODES                                                              //
//                                                                            //
// The first byte of every message sent or received defines its type. You     //
// should not make changes here, instead, change the MessageType.java file    //
// and run its main() to generate the code below. This ensures any other      //
// application that relies on those messages will have the same codes.        //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

// ---- BEGINNING OF [IOMessage.java] OUTPUT ---- //
#define MAX_MESSAGE_LENGTH 33
#define MT_UNKNOW                      0x00  // (  1B max) [n/a]
#define MT_ERROR                       0x80  // (  1B max) [n/a]
#define REQUEST_PING                   0x01  // (  9B max) B1-8=Current time in millis
#define RESPOND_PONG                   0x81  // (  9B max) B1-8=Echo same bytes back
#define REQUEST_IO_COUNT               0x02  // (  1B max) [n/a]
#define RESPOND_IO_COUNT               0x82  // (  3B max) B1=Number of Inputs ; B2=Number of Outputs
#define REQUEST_TURNON_ONE             0x03  // (  2B max) B1=Output# to set ON
#define RESPOND_TURNON_ONE             0x83  // (  2B max) B1=Output# set to ON
#define REQUEST_TURNOFF_ONE            0x04  // (  2B max) B1=Output# to set OFF
#define RESPOND_TURNOFF_ONE            0x84  // (  2B max) B1=Output# set to OFF
#define REQUEST_TURNON_MANY            0x05  // ( 33B max) B1-32=Output bits, 1(turn on) 0(do not change)
#define RESPOND_TURNON_MANY            0x85  // ( 33B max) B1-32=Output bits, 1(turned on) 0(unchanged)
#define REQUEST_TURNOFF_MANY           0x06  // ( 33B max) B1-32=Output bits, 1(turn off) 0(do not change)
#define RESPOND_TURNOFF_MANY           0x86  // ( 33B max) B1-32=Output bits, 1(turned off) 0(unchanged)
#define REQUEST_TURNONOFF_ALL          0x07  // ( 33B max) B1-32=Output bits, 1(turn on) 0(turn off)
#define RESPOND_TURNONOFF_ALL          0x87  // ( 33B max) B1-32=Output bits, 1(turned on) 0(turned off)
#define REQUEST_CHECK_OUTPUT           0x08  // (  2B max) B1=Output# to check
#define RESPOND_CHECK_OUTPUT           0x88  // (  3B max) B1=Output # checked ; B2=0x00(off) other(on)
#define REQUEST_CHECK_OUTPUTS          0x09  // (  1B max) [n/a]
#define RESPOND_CHECK_OUTPUTS          0x89  // ( 33B max) B1-32=Output bits, 0(off) 1(on)
#define REQUEST_CHECK_INPUT            0x0A  // (  2B max) B1=Input# to check
#define RESPOND_CHECK_INPUT            0x8A  // (  3B max) B1=Input# checked ; B2=0(off) 1(on)
#define REQUEST_CHECK_INPUTS           0x0B  // (  1B max) [n/a]
#define RESPOND_CHECK_INPUTS           0x8B  // ( 33B max) B1-32=Input bits, 0(off) 1(on)
#define RESPOND_IO_CHANGED             0x8C  // (  5B max) B1=Input# Changed ; B2=Input New State ; B3=Output# Changed ; B4=Output New State
// ---- END OF [IOMessage.java] OUTPUT ---- //




















////////////////////////////////////////////////////////////////////////////////
//                                                                            //
// INCLUDES                                                                   //
//                                                                            //
// Please use only libraries that are included in the latest Arduino, this    //
// facilitates new users to grab this code and compile it straightaway,       //
// without needing to browse around for the required files.                   //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

#include <SPI.h>
#include <Ethernet.h>
#include <EthernetUdp.h>




















////////////////////////////////////////////////////////////////////////////////
//                                                                            //
// DEBUGGING CODE                                                             //
//                                                                            //
// The code here allows you to allow debug-code to be compiled or not. The    //
// debugging is made throughout a serial connection, but if debugging is not  //
// used (production code) then make sure it does not waste memory or cycles.  //
// The serial communication is only initialized if debugging is active.       //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

// If the line below is uncommented, debugging is enabled.
#define SERIAL_DEBUG

// Define the debug function only if debugging is used. If not used, define
// and empty function in the hope the compiler will completely ignore the
// call.
// TODO -- check if the compile really optimizes that code.
#ifdef SERIAL_DEBUG
void debugln(char* str) {
  Serial.print(millis());
  Serial.print(' ');
  Serial.println(str);
}
void debug(char* str) {
  Serial.print(millis());
  Serial.print(' ');
  Serial.print(str);
}
#else
void debugln(char* str) {
}
void debug(char* str) {
}
#endif




















////////////////////////////////////////////////////////////////////////////////
//                                                                            //
// CONSTANTS                                                                  //
//                                                                            //
// Avoid using #define for constants, using the 'const' keyword instead.      //
//                                                                            //
// Please note that if the number of inputs or outputs go over 256, we may    //
// need to change the communication messages (structure and sizes), to        //
// acomodate the necessary information.                                       //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

// MAC Address
// If you have an Arduino Ethernet or Ethernet Shield, it probably has the address on the back.
// If not, then you need to make sure no other equipment on your network shares this address.
const byte mac[] = {  
  0x00, 0xAA, 0xBB, 0xCC, 0xDE, 0x02
};

// UDP Port -- in which port should we listen for UDP Packets?
const unsigned int udpPort = 31322; // = 0x7A5A = ASCII for 'zZ'

// How many pins are used to select inputs to read? This limits the ammount of inputs.
const byte numberOfInputSelectors = 6;

// How many inputs can your hardware handle? In general is 2^(selectors)
const byte numberOfInputs = 1 << numberOfInputSelectors;

// How many outputs can your hardware handle? Please test thoroughly if more than 64.
const byte numberOfOutputs = 64;

// How many bytes we need to store all inputs (1 input per bit)
const byte bytesForInputs = (numberOfInputs / 8) + (numberOfInputs % 8 == 0 ? 0 : 1);

// How many bytes we need to store all outputs (1 output per bit)
const byte bytesForOutputs = (numberOfOutputs / 8) + (numberOfOutputs % 8 == 0 ? 0 : 1);

// Network Configuration
const IPAddress netIP(192, 168, 1, 50);
const IPAddress netDNS(192, 168, 1, 1);
const IPAddress netGateway(192, 168, 1, 1);
const IPAddress netMask(255, 255, 255, 0);
const IPAddress netBroadcast(netIP[0] | ~netMask[0], netIP[1] | ~netMask[1], netIP[2] | ~netMask[2], netIP[3] | ~netMask[3]);

// Hardware pins mapping:
const byte pinInputSelect[] = { 
  17, 16, 15, 2, 3, 5 };
const int pinInputRead = 14;
const int pinOutputLatch = 8;
const int pinOutputClock = 9;
const int pinOutputData = 7;
const int pinConfigMode = 6;




















////////////////////////////////////////////////////////////////////////////////
//                                                                            //
// GLOBALS                                                                    //
//                                                                            //
// The caches (inputs and outputs) could store 8 states per byte, instead of  //
// using booleans which use 1 byte per variable. However, I think this may    //
// avoid many bit operations to find one value, which adds complexity to the  //
// code and may be even slower depending on the implementation.               //
//                                                                            //
// Please feel free to submit a better solution if there is a great           //
// improvement in performance.                                                //
//                                                                            //
// TODO -- check if putting common loops' variables as globals may improve    //
// the performance.                                                           //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

// Reference to the UDP Library.
EthernetUDP Udp;

// Allocates a buffer only big enough to fit the biggest possible message.
byte udpBuffer[MAX_MESSAGE_LENGTH];

// Allocates one boolean (one byte) per input to store their states.
boolean inputs[numberOfInputs];

// Allocates one boolean (one byte) per output to store their states.
boolean outputs[numberOfOutputs];

// If anything changes the outputs, set this boolean to true. Once the outputs
// are properly set, this variable will be set back to false.
boolean changedOutput;




















////////////////////////////////////////////////////////////////////////////////
//                                                                            //
// ARDUINO MAIN -- setup() and loop()                                         //
//                                                                            //
// The setup() function is called once when starting, and then the loop()     //
// function is called over and over, forever and ever... (yeah, right!)       //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

void loop() {
  // 1) Read inputs, we need to know if something changed and act if it did.
  readInputs();
  // 2) Process one UDP message from the network (if available). 
  //    Do not enter a loop and check all messages so, if flooded, do not
  //    halt other things just read them.
  readUDP();
  // 3) If reading inputs or network changed the outputs, commit it!
  if (changedOutput) writeOutputs();

#ifdef SERIAL_DEBUG
  static unsigned long nextMillis = 0;
  static unsigned long loopCount = 0;
  unsigned long   now = millis();
  loopCount++;
  if (loopCount == 0xFFFFFFFF) loopCount = 1; // do not overflow
  if (nextMillis < now) {
    debug("Loops per second: ");
    Serial.print(loopCount / 10);
    Serial.print("; uS/loop: ");
    Serial.println(1000000 / (loopCount / 10));
    loopCount = 0;
    nextMillis = now + 10000;
  }
#endif
}

void setup() {
  // Init serial (if in debug mode).
#ifdef SERIAL_DEBUG
  unsigned long bootStartMicros = micros();
  Serial.begin(115200);
  while (!Serial); // wait for Leonard please...
  debugln("Hello World! My marathon starts now, let's run...");
#endif

  // Set pins' modes and pull-up resistors.
  debugln("Setting up pins' mode...");
  pinMode(pinOutputLatch, OUTPUT);
  pinMode(pinOutputClock, OUTPUT);  
  pinMode(pinOutputData, OUTPUT);
  for (byte b=0; b<numberOfInputSelectors; b++) {
    pinMode(pinInputSelect[b], OUTPUT);
  }
  pinMode(pinInputRead, INPUT);
  pinMode(pinConfigMode, INPUT);
  digitalWrite(pinInputRead, HIGH); // let's get high
  digitalWrite(pinConfigMode, HIGH); // config mode is active on low

  // Initialize globals
  debugln("Setting up globals...");
  for (int i=0; i<MAX_MESSAGE_LENGTH; i++) { // reset the buffer (not really needed)
    udpBuffer[i] = 0; 
  } 
  for (int i=0; i<numberOfInputs; i++) inputs[i] = true; // has pullup, so default input is HIGH
  for (int i=0; i<numberOfOutputs; i++) outputs[i] = false; // set all to LOW at start and...
  changedOutput = true; //.. make sure it will be commited when the loop starts.

  // Initialize network (STATIC mode, comment out DHCP mode)
  debugln("Initialize static-mode network...");
  Ethernet.begin((byte*)mac, netIP, netDNS, netGateway, netMask);

  // Initialize network (DHCP mode, comment out STATIC mode)
  /*
  debugln("Initialize dhcp-mode network...");
   debugln("Get IP");
   while (Ethernet.begin(mac) == 0) {
   debugln("fail");
   delay(1000);
   debugln("Get IP");
   }
   */

  debugln("Starting to listen for UDP packets...");
  Udp.begin(udpPort);  

  // Setup complete, show some debugging some information...
#ifdef SERIAL_DEBUG
  debugln("Setup Complete! Debugging info:");
  Serial.print("                     udpPort=");
  Serial.println(udpPort);
  Serial.print("      numberOfInputSelectors=");
  Serial.println(numberOfInputSelectors);
  Serial.print("              numberOfInputs=");
  Serial.println(numberOfInputs);
  Serial.print("             numberOfOutputs=");
  Serial.println(numberOfOutputs);
  Serial.print("              bytesForInputs=");
  Serial.println(bytesForInputs);
  Serial.print("             bytesForOutputs=");
  Serial.println(bytesForOutputs);
  Serial.print("                  IP Address=");
  Serial.println(Ethernet.localIP());
  Serial.print("                         DNS=");
  Serial.println(Ethernet.dnsServerIP());
  Serial.print("                     Gateway=");
  Serial.println(Ethernet.gatewayIP());
  Serial.print("                     Netmask=");
  Serial.println(Ethernet.subnetMask());
  Serial.print("           Broadcast Address=");
  Serial.println(netBroadcast);

  Serial.print("Boot Time (microsseconds): ");
  Serial.println(micros() - bootStartMicros);
#endif
}




















////////////////////////////////////////////////////////////////////////////////
//                                                                            //
// INPUT READING FUNCTIONS                                                    //
//                                                                            //
// Functions related to reading inputs from the system and handling changes.  //
//                                                                            //
// Note: inputs are active on low (they have pull-up resistors, when the      //
// input is grounded it becomes active.                                       //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

// Called from loop() function.
void readInputs() {
  // TODO Try to find a better way to scan all inputs with fewer changes in the selector.
  // Example: ask for 000000, then 000001, then 000011, then 000111 and so on...
  // it could improve (a lot?) the performance, reducing the number of digitalWrites

    // For each input...
  for (byte reading = 0; reading < numberOfInputs; reading++) {
    // ...set all input seletors to DEMUX the reading pin...
    for (byte selecting = 0; selecting<numberOfInputSelectors; selecting++) {
      digitalWrite(pinInputSelect[selecting], bitRead(reading, selecting));
    }
    // ...and read it!
    boolean newValue = digitalRead(pinInputRead);

    // If it changed, set the new value and call another function to handle it.
    if (inputs[reading] != newValue) {
      inputs[reading] = newValue;
      inputChanged(reading);
    }
  }
}

// Input was changed (parameter = input number). Handle it!
void inputChanged(byte nInput) {
  if (nInput >= numberOfOutputs) return; // ignore if we have less outputs
  outputs[nInput] = !outputs[nInput]; // invert output
  changedOutput  = true;

  // broadcast via UDP
  udpBuffer[0] = RESPOND_IO_CHANGED;
  udpBuffer[1] = nInput;
  udpBuffer[2] = !inputs[nInput]; // active on low
  udpBuffer[3] = nInput; // someone could map different input to output
  udpBuffer[4] = outputs[nInput];
  udpResponse(5);

#ifdef SERIAL_DEBUG
  debug("Input Changed: #");
  Serial.print(nInput);
  Serial.print(" is now ");
  Serial.println(inputs[nInput] ? "OFF" : "ON"); // input is active on low
#endif
}




















////////////////////////////////////////////////////////////////////////////////
//                                                                            //
// UDP NETWORK FUNCTIONS                                                      //
//                                                                            //
// Functions related to sending and receiving UDP messages.                   //
//                                                                            //
// Note that the send and receive buffer are shared. We receive a message     //
// into the buffer, change some bytes as needed, then send it back.           //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

// Called from loop() function.
void readUDP() {
  // Try reading one packet. If none avaiable, stop here.
  int packetSize = Udp.parsePacket();
  if (packetSize == 0) return; // nothing to read

#ifdef SERIAL_DEBUG
  // Debug packet information.
  debug("UDP[");
  Serial.print(packetSize);
  Serial.print("] ");
  IPAddress remote = Udp.remoteIP();
  for (byte b = 0; b < 4; b++) {
    Serial.print(remote[b], DEC);
    if (b < 3) Serial.print("."); 
  }
  Serial.print(":");
  Serial.println(Udp.remotePort());
#endif

  // If the packet is too big, just discard it.
  if (packetSize > MAX_MESSAGE_LENGTH) {
    while (Udp.available()) {
      Udp.read(); 
    }
    return;
  }

  // The packet is valid, read it indo the buffer.
  Udp.read(udpBuffer, MAX_MESSAGE_LENGTH);
#ifdef SERIAL_DEBUG
  debug("<");
  for (byte b = 0; b < packetSize; b++) {
    Serial.print(' ');
    if (udpBuffer[b] < 0x10) Serial.print('0');
    Serial.print(udpBuffer[b], HEX);
  }
  Serial.println();
#endif

  // If the packet's first byte starts with the bit 1 (one), it is a response message.
  if (udpBuffer[0] & 0x80) {
    debugln("packet discarded"); // response message
  } 
  else {
    udpReceived(); // message read successfully, go on...
  }
}

// Process the received UDP Message.
// For more information on what which message does, check
// the message definition section in the beginning of this file.
void udpReceived() {
  // First byte is the bytecode, defines the message type.
  switch (udpBuffer[0]) {
  case REQUEST_PING:
    udpResponse(9); // message bytecode + 8 bytes
    return;
  case REQUEST_IO_COUNT:
    udpBuffer[1] = numberOfInputs;
    udpBuffer[2] = numberOfOutputs;
    udpResponse(3);
    return;
  case REQUEST_TURNON_ONE:
    setOutput(udpBuffer[1], true);
    udpResponse(2);
    return;
  case REQUEST_TURNOFF_ONE:
    setOutput(udpBuffer[1], false);
    udpResponse(2);
    return;
  case REQUEST_TURNON_MANY:
    for (int i=0; i<numberOfOutputs; i++) {
      if (udpBuffer[1 + i / 8] & (1 << (i % 8))) outputs[i] = true;
    }
    changedOutput = true;
    udpResponse(1+bytesForOutputs);
    return;
  case REQUEST_TURNOFF_MANY:
    for (int i=0; i<numberOfOutputs; i++) {
      if (udpBuffer[1 + i / 8] & (1 << (i % 8))) outputs[i] = false;
    }
    changedOutput = true;
    udpResponse(1+bytesForOutputs);
    return;
  case REQUEST_TURNONOFF_ALL:
    for (int i=0; i<numberOfOutputs; i++) {
      // indirect assignment below to avoid booleans with values other than 1 for true.
      outputs[i] = (udpBuffer[1 + i / 8] & (1 << (i % 8))) ? true : false;
    }
    changedOutput = true;
    udpResponse(1+bytesForOutputs);
    return;
  case  REQUEST_CHECK_OUTPUT:
    if (udpBuffer[1] >= numberOfOutputs) return;
    udpBuffer[2] = outputs[udpBuffer[1]];
    udpResponse(3);
    return;
  case REQUEST_CHECK_OUTPUTS:
    copyBooleansToBits(numberOfOutputs, outputs, &udpBuffer[1]);
    udpResponse(1+bytesForOutputs);
    return;    
  case  REQUEST_CHECK_INPUT:
    if (udpBuffer[1] >= numberOfInputs) return;
    udpBuffer[2] = !inputs[udpBuffer[1]]; // input is active on low
    udpResponse(3);
    return;
  case REQUEST_CHECK_INPUTS:
    copyBooleansToBits(numberOfInputs, inputs, &udpBuffer[1]);
    //invert output (active on low), skipping first byte (bytecode)
    for (int i=1; i<=numberOfInputs; i++) {
      udpBuffer[i] = ~udpBuffer[i];
    }
    udpResponse(1+bytesForInputs);
    return;    
  }
  debugln("Invalid Message");
}

// Sends an UDP message, with 'bytes' bytes from the buffer.
void udpResponse(int bytes) {
  // Ensure that the response bit is on.
  udpBuffer[0] = udpBuffer[0] | 0x80;

#ifdef SERIAL_DEBUG
  debug(">");
  for (byte b = 0; b < bytes; b++) {
    Serial.print(' ');
    if (udpBuffer[b] < 0x10) Serial.print('0');
    Serial.print(udpBuffer[b], HEX);
  }
  Serial.println();
#endif

  // Send back to the whoever sent the last message (if ping)
  // If not ping, send as broadcast so everyone knows what happened!
  Udp.beginPacket(udpBuffer[0] == RESPOND_PONG ? Udp.remoteIP() : netBroadcast, udpPort);
  Udp.write(udpBuffer, bytes);
  Udp.endPacket();
}





















////////////////////////////////////////////////////////////////////////////////
//                                                                            //
// OUTPUT-RELATED FUNCTIONS                                                   //
//                                                                            //
// Functions related to writing to outputs (and reading their states back).   //
//                                                                            //
// Anytime an output needs to be changed, change its buffer contents and set  //
// the global variable 'changedOutput' to true. This ensures that all changes //
// will be commited at once and that writing out (which may take some time)   //
// only occurs when needed.                                                   //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

// called from loop() every time changedOutput is true
void writeOutputs() {
  // prepare to send (hold old outputs state until finished shifting)
  digitalWrite(pinOutputLatch, LOW); 
  // note: 'i' starts from 1 (one), not from 0 (zero)
  byte bits = 0; // store 8 booleans into 8 bits
  for (int i=numberOfOutputs-1; i>=0; i--) {
    //check if the output is on
    if (outputs[i]) bits |= 1; // set bit on
    //check if one byte is finished
    if (i % 8 == 0) {
      // byte is finished, write it out and reset the bits
      shiftOut(pinOutputData, pinOutputClock, MSBFIRST, bits);  
      bits = 0;
    } 
    else {
      // byte not finished, shift the bits left before reading next
      bits <<= 1;
    }
  }
  // all data sent, now commit them to the output
  digitalWrite(pinOutputLatch, HIGH);
  // reset changedOutput until it changes again
  changedOutput = false;
}

// if the output is valid, set it on or off
void setOutput(byte output, boolean onoff) {
  // check if valid output number
  if (output >= numberOfOutputs) return;
  // check if no change is needed
  if (outputs[output] == onoff) return;
  // make change
  outputs[output] = onoff;
  changedOutput = true;

#ifdef SERIAL_DEBUG
  debug("Set Output: #");
  Serial.print(output);
  Serial.print(" to ");
  Serial.println(onoff ? "ON" : "OFF");
#endif
}




















////////////////////////////////////////////////////////////////////////////////
//                                                                            //
// UTILITY FUNCTIONS                                                          //
//                                                                            //
// General utility functions.                                                 //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

void copyBooleansToBits(int numberOfBooleans, boolean* booleans, byte* bits) {
  debugln("Coying boolean to bits...");
  for (int i=numberOfBooleans-1; i>=0; i--) {
    byte* tByte = &bits[i / 8]; // which byte to write
    *tByte <<= 1; // shift contents to left
    if (booleans[i]) *tByte |= 1; //set new bit if needed
  }
}















