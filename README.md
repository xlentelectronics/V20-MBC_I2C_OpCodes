# Z80-MBC2 
The Z80-MBC2 is an easy to build Z80 SBC (Single Board Computer). It is the "evolution" of the Z80-MBC (https://hackaday.io/project/19000-a-4-4ics-z80-homemade-computer-on-breadboard), with a SD as "disk emulator" and with a 128KB banked RAM for CP/M 3 (but it can run CP/M 2.2, QP/M 2.71, UCSD Pascal and others).
It has an optional on board 16x GPIO expander, and uses common cheap add-on modules for the SD and the RTC options. It has an "Arduino heart" using an Atmega32A as EEPROM and "universal" I/O emulator (so a "legacy" EPROM programmer is not needed).
It is a complete development "ecosystem", and using the iLoad boot mode it is possible cross-compile, load and execute on the target an Assembler or C program (using the SDCC compiler) with a single command (like in the Arduino IDE). 
Project page: https://hackaday.io/project/159973-z80-mbc2-4ics-homemade-z80-computer
Latest IOS revision: IOS S220718-R290823

# Z80-MBC2 Firmware I2C OpCodes
The latest firmware has been updated with some additional OpCodes to connect a LCD2004 display to the board as well as OpCodes to address I2C devices.
The LCD OpCodes are related to the common used Arduino LiquidCrystal_I2C.h library which is included in the repository.
The I2C OpCodes are working with the Arduino Wire.h library.

## Picture of I2C LCD2004
The LCD needs to have a I2C module based on the PCF8574 attached to the display with base address 0x27.

![Picture of an I2C LCD2004 connected to the Z80-MBC2](/Pictures/Z80-MBC2_LCD.jpg) 

## Screenshot I2CSCAN.BAS output
I2CSCAN.BAS program is a I2C bus scanner to detect if there are I2C Devices connected to the I2C bus or not.
Some known I2C devices are listed with their device name, like the MCP23017, otherwise the device is listed as 'unknown'.

![Screenshot of I2C SCAN](/Pictures/Z80-MBC2_I2C.jpg)

# Z80-MBC2 I2C OpCode firmware
The version of the firmware is S220718-R290823-A141225.
Place firmware in a folder named S220718-R290823-A141225_IOS-Z80-MBC2_I2C_OpCode and copy the LiquidCrystal_I2C library into the Arduino libries folder.
The code should compile and upload without any errors.
