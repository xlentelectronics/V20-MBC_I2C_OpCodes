10 PRINT CHR$(27);"[2J"; : PRINT CHR$(27);"[1;1H"
20 PRINT "  *******************************************"
30 PRINT "  *                                         *"
40 PRINT "  *                Z80-MBC2                 *" 
50 PRINT "  *                                         *"
60 PRINT "  *           I2C DEVICE SCANNER            *"
70 PRINT "  *                                         *"
80 PRINT "  *         by X-LENT ELECTRONICS           *"
90 PRINT "  *                                         *"
100 PRINT "  *       Reserved I2C addresses for        *"
110 PRINT "  *            the Z80-MBC2 are             *"
120 PRINT "  *        &H20, &H27, &H57 and &H68        *"
130 PRINT "  *            (7-bit notation)             *"
140 PRINT "  *                                         *"
150 PRINT "  *******************************************"
160 PRINT
170 NDEVICES = 0
180 ACK = 1
190 I2CDETECT = &H92
200 PRINT " I2C Device found at HEX address (7-bit notation):"
210 FOR I2CADDR = 1 TO 127
220 OUT 1,I2CDETECT : OUT 0, I2CADDR
230 ACK = INP(0)
240 IF ACK = 0 THEN GOSUB 300
250 NDEVICES = NDEVICES + 1
260 NEXT I2CADDR
270 IF NDEVICES = 0 THEN PRINT : PRINT "No I2C Devices found!"
280 PRINT
290 END
300 REM *** GOSUB I2C DEvice detected ***
310 Z$ = " - Unknown I2C Device"
320 IF I2CADDR = 95 THEN GOTO 440 : REM Known Ghost address of 24LC32 on RTC module
330 IF I2CADDR = 32 THEN Z$ = " - MCP23017 IO Extender on Z80-MBC2"
340 IF I2CADDR >= 33 AND I2CADDR =< 38 THEN Z$ = " - PCF8574, PCF8575 or MCP23017 IO Extender"
350 IF I2CADDR >= 56 AND I2CADDR =< 63 THEN Z$ = " - PCF8574A or PCF8575A"
360 IF I2CADDR = 39 THEN Z$ = " - I2C LCD1602 or LCD4002"
370 IF I2CADDR = 112 AND I2CADDR =< 118  THEN Z$ = " - SAA1064 4-digit LED display driver"
380 IF I2CADDR = 72 AND I2CADDR =< 79 THEN Z$ = " - PCF8591 4-ch ADC + DAC output or a DS1621 sensor"
390 IF I2CADDR >= 80 AND I2CADDR =< 85  THEN Z$ = " - 24LCxxx Eeprom"
400 IF I2CADDR = 87 THEN Z$ = " - 24LC32 Eeprom on RTC module"
410 IF I2CADDR = 104 THEN Z$ = " - DS3231 RTC module on Z80-MBC2"
420 IF I2CADDR = 119 THEN Z$ = " - BMP180 Pressure, Temperature & Humidity sensor"
430 PRINT " &H"; : PRINT HEX$(I2CADDR); : PRINT Z$
440 ACK = 1
450 RETURN
