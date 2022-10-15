/*

Important notes:

4-bit operation:
	-only pins DB4-DB7 are used
	-Upper 4 bits first, then lower 4

*/

#include <stdint.h>

// Comment this for 8 bit operation
#define FOUR_BIT_OPERATION

// Replace quotation marks with the letter of the GPIO port for data lines
#define DATA_PORT GPIOB
#define RCC_DATA_ENR RCC_AHB2ENR_GPIOBEN_Pos

// Add the pins that correspond to the following data lines
#define DB4 3
#define DB5 4
#define DB6 5
#define DB7 6

#ifndef FOUR_BIT_OPERATION

	#define DB0 0
	#define DB1 1
	#define DB2 2
	#define DB3 3

#endif

// Edit the following with the letter of the GPIO port for the RW line and the pin #
#define RW_PORT GPIOB
#define RCC_RW_ENR RCC_AHB2ENR_GPIOBEN_Pos
#define RW_PIN 0

// Edit the following with the letter of the GPIO port for the RS line and the pin #
#define RS_PORT GPIOB
#define RCC_RS_ENR RCC_AHB2ENR_GPIOBEN_Pos
#define RS_PIN 1

// Edit the following with the letter of the GPIO port for the E line and the pin #
#define E_PORT GPIOB
#define RCC_E_ENR RCC_AHB2ENR_GPIOBEN_Pos
#define E_PIN 2

// Edit the following with the number of columns (only used for printf)
#define LCD_COL_COUNT 16

// DO NOT EDIT BELOW THIS LINE

void setE(uint8_t sOrC);
void setRW(uint8_t sOrC);
void setRS(uint8_t sOrC);
void sendByte(uint8_t byte);
void sendNibble(uint8_t nibble);
void sendInstruction(uint8_t data);

// Write a char to the position of the cursor
void writeDisplay(uint8_t data);

// Manual initialization of the display
void initDisplay(void);


// Clears the display
void clearDisplay(void);

// Brings the cursor to row 0, column 0
void returnHome(void);

/*
* Used to control the default display config
* Params: 	
* incOrDec: 1, move right; 0, move left
* S: 1, display shifts; 0, cursor moves
*/
void entryModeSet(int incOrDec, int S);

/*
* Used to turn on/off the display, cursor, and blinking
* Recommended to use DisplayOn/Off(), CursorOn/Off(), BlinkingOn/Off() instead
*/
void displayControl(uint8_t displayOn, uint8_t cursorOn, uint8_t blinkingOn);

// Turns the display on
void displayOn();

// Turns the display off
void displayOff();

// Turns the cursor on
void cursorOn();

// Turns the cursor off
void cursorOff();

// Turns blinking on
void blinkingOn();

// Turns blinking off
void blinkingOff();

/*
* Moves the cursor or shifts the display
* Recommended to use cursorShiftRight/Left() or
* displayShiftRight/Left() instead
* Params:
* cOrD: 0, cursor; 1, display
* rOrL: 0, left; 1, right
*/
void cursorOrDisplayShift(int cOrD, int rOrL);

/*
* Moves the cursor
* Recommended to use cursorShiftRight/Left() instead
* Params:
* rOrL: 0, left; 1, right
*/
void cursorShift(int rOrL);

/*
* Shifts the display
* Recommended to use displayShiftRight/Left() instead
* Params:
* rOrL: 0, left; 1, right
*/
void displayShift(int rOrL);

// Moves the cursor to the right
void cursorShiftRight();

// Moves the cursor to the left
void cursorShiftLeft();

// Shifts the display to the right
void displayShiftRight();

// Shifts the display to the left
void displayShiftLeft();

/*
* Sets the number of lines and size of each cell
* Recommended to use specific functions for number of lines
* and cell size instead
* Params:
* lines: 0, 1 line; 1, 2 lines
* font: 0, 8by5; 1, 10by5
*/
void functionSet(int lines, int font);

// Sets the display to 2 lines of 8by5 cells
void functionSet2Lines5By8();

// Sets the display to 1 line of 8by5 cells
void functionSet1Line5By8();

// Sets the display to 2 lines of 10by5 cells
void functionSet2Lines5By10();

// Sets the display to 1 line of 10by5 cells
void functionSet1Line5By10();

// Prints a string to the lcd
void lcdPrintString(char* string);

// Prints formatted string to lcd
void lcdPrintf(char *format, ...);