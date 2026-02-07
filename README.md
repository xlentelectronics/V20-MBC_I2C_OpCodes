# V20-MBC 
The V20-MBC is an easy to build V20HL SBC (full static CMOS version) or 80C88 CPU SBC (Single Board Computer). It follows the same "concept" of the Z80-MBC2, with an SD as disk emulator and up to 1024KB RAM, (https://hackaday.io/project/170924-v20-mbc-a-v20-8088-8080-cpu-homebrew-computer), 

It has an optional on board 16x GPIO expander, and uses common cheap add-on modules for the SD and the RTC options.
It has an Arduino heart using an Atmega32A as EEPROM and universal I/O emulator (so a legacy EPROM programmer is not needed) programmed with Arduino IDE.
It is compatible with the uTerm (https://hackaday.io/project/165325) and uCom (https://hackaday.io/project/165709) boards. 

# V20-MBC Firmware I2C OpCodes
Andy Jackson has ported the Z80-MBC2 firmware with I2C OpCodes to the V20-MBC firmware. He just V20-MBC firmware version S260320_R230520_IOS_V20-MBC for it.
The V20-MBC firmware with the I2C OpCodes is available as version S260320_R230520_A010226_IOS-V20-MBC_I2C_Opcodes.
With this addition, also the V20-MBC has the possibility to connect a LCD2004 display or other I2C devices to the board.
The LCD OpCodes are related to the common used Arduino LiquidCrystal_I2C.h library which is included in the repository.
The I2C OpCodes are working with the Arduino Wire.h library.

## Picture of I2C LCD2004
The LCD needs to have a I2C module based on the PCF8574 attached to the display with base address 0x27.

![Picture of an I2C LCD2004 connected to the V20-MBC](/Pictures/V20-MBC_LCD.jpg) 

