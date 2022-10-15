#include "Lcd.h"
#include "main.h"
#include <stm32g441xx.h>
#include <stm32g4xx_hal.h>
#include <stdarg.h>
#include <stdio.h>


uint8_t displayMode = 0b1000;

uint32_t DWT_Delay_Init(void)
{
	CoreDebug->DEMCR &= ~CoreDebug_DEMCR_TRCENA_Msk;
	CoreDebug->DEMCR |= CoreDebug_DEMCR_TRCENA_Msk;

	DWT->CTRL &= ~DWT_CTRL_CYCCNTENA_Msk;
	DWT->CTRL |= DWT_CTRL_CYCCNTENA_Msk;

	DWT->CYCCNT = 0;

	__ASM volatile ("NOP");
	__ASM volatile ("NOP");
	__ASM volatile ("NOP");

	if(DWT->CYCCNT)
	{
		return 0;
	}
	else
	{
		return 1;
	}

}

void DWT_Delay_us(volatile uint32_t micros)
{
	uint32_t iniTicks = DWT->CYCCNT;
	uint32_t ticks = 100000000 / 1000000;
	micros *= ticks;
	while((DWT->CYCCNT - iniTicks) < micros - ticks);
}

void DWT_Delay_ms(volatile uint32_t millis)
{
	uint32_t iniTicks = DWT->CYCCNT;
	uint32_t ticks = 100000000 / 1000;
	millis *= ticks;
	while((DWT->CYCCNT - iniTicks) < millis);
}

void setE(uint8_t sOrC)
{
	uint32_t ePortOut;
	ePortOut = E_PORT->ODR;

	if (sOrC)
	{
		ePortOut |= (1<<E_PIN);
	}
	else
	{
		ePortOut &= ~(1<<E_PIN);
	}

	E_PORT->ODR = ePortOut;
}

void setRW(uint8_t sOrC)
{
	uint16_t rWPortOut;
	rWPortOut = RW_PORT->ODR;

	if (sOrC)
	{
		rWPortOut |= (1<<RW_PIN);
	}
	else
	{
		rWPortOut &= ~(1<<RW_PIN);
	}

	RW_PORT->ODR = rWPortOut;
}

void setRS(uint8_t sOrC)
{
	uint16_t rSPortOut;
	rSPortOut = RS_PORT->ODR;

	if (sOrC)
	{
		rSPortOut |= (1<<RS_PIN);
	}
	else
	{
		rSPortOut &= ~(1<<RS_PIN);
	}

	RS_PORT->ODR = rSPortOut;
}


#ifndef FOUR_BIT_OPERATION

void sendByte(uint8_t byte)
{
	uint16_t portOut;
	portOut = DATA_PORT->ODR;

	portOut &= ~(1 << DB4) & ~(1<<DB5) & ~(1<<DB6) & ~(1<<DB7) & 
		~(1 << DB0) & ~(1<<DB1) & ~(1<<DB2) & ~(1<<DB3); 

	portOut |= (byte >> 0 & 0b1) << DB0;
	portOut |= (byte >> 1 & 0b1) << DB1;
	portOut |= (byte >> 2 & 0b1) << DB2;
	portOut |= (byte >> 3 & 0b1) << DB3;
	portOut |= (byte >> 4 & 0b1) << DB4;
	portOut |= (byte >> 5 & 0b1) << DB5;
	portOut |= (byte >> 6 & 0b1) << DB6;
	portOut |= (byte >> 7 & 0b1) << DB7;

	DATA_PORT->ODR = portOut;

	setE(0);
	setE(1);
	setE(0);
}

#else

void sendNibble(uint8_t nibble)
{
	uint16_t portOut;
	portOut = DATA_PORT->ODR;

	nibble = ((nibble << 4 ) >> 4);

	portOut &= ~(1 << DB4) & ~(1<<DB5) & ~(1<<DB6) & ~(1<<DB7);

	portOut |= (nibble & 0b1) << DB4;
	portOut |= (nibble >> 1 & 0b1) << DB5;
	portOut |= (nibble >> 2 & 0b1) << DB6;
	portOut |= (nibble >> 3 & 0b1) << DB7;

	DATA_PORT->ODR = portOut;

}

void sendByte(uint8_t data)
{

	sendNibble(data >> 4);

	setE(0);
	setE(1);
	setE(0);

	DWT_Delay_us(300);

	sendNibble(data);

	setE(0);
	setE(1);
	setE(0);

	DWT_Delay_us(300);

}

#endif

int isBusy()
{
	DATA_PORT->MODER &= ~(0b11 << ((DB7 << 1)));

	setRW(1);
	setRS(0);
	setE(1);

	int isBusy = 0;

	if (DATA_PORT->IDR & (1<<DB7))
		isBusy = 1;

	setE(0);
	DATA_PORT->MODER |= (0b01 << ((DB7 << 1)));
	
	return isBusy;
}

void waitWhileBusy()
{
	DATA_PORT->MODER &= ~(0b11 << ((DB7 << 1)));

	setRW(1);
	setRS(0);
	setE(1);
	while(DATA_PORT->IDR & (1<<DB7))
	{
		setE(0);
		setE(1);
		setE(0);
		setE(1);
	}

	setE(0);
	DATA_PORT->MODER |= (0b01 << ((DB7 << 1)));
}

void sendInstruction(uint8_t data)
{
	// Make sure the display isn't busy
	waitWhileBusy();
	
	setRW(0);
	setRS(0);

	sendByte(data);

}


void writeDisplay(uint8_t data)
{
	// Make sure the display isn't busy
	waitWhileBusy();

	setRW(0);
	setRS(1);

	sendByte(data);

}

#ifndef FOUR_BIT_OPERATION

void initDisplay(void)
{
	// Enable the GPIO for the data port
	RCC->AHB1ENR |= (1<<RCC_DATA_ENR);

	// Set each of the data lines to outputs
	DATA_PORT->MODER &= ~(0b11 << (DB4 << 1)) & ~(0b11 << (DB5 << 1)) & ~(0b11 << (DB6 << 1)) & ~(0b11 << (DB7 << 1));
					 &  ~(0b11 << (DB0 << 1)) & ~(0b11 << (DB1 << 1)) & ~(0b11 << (DB2 << 1)) & ~(0b11 << (DB3 << 1));
	DATA_PORT->MODER |= (0b01 << (DB4 << 1)) | (0b01 << (DB5 << 1)) | (0b01 << (DB6 << 1)) | (0b01 << (DB7 << 1))
					 |  (0b01 << (DB0 << 1)) | (0b01 << (DB1 << 1)) | (0b01 << (DB2 << 1)) | (0b01 << (DB3 << 1));
	
	// Enable the GPIO for the RW port
	RCC->AHB1ENR |= (1<<RCC_RW_ENR);

	// Set the rw line to output
	RW_PORT->MODER &= ~(0b11 << (RW_PIN << 1));
	RW_PORT->MODER |= (0b01 << (RW_PIN << 1));

	// Enable the GPIO for the RS port
	RCC->AHB1ENR |= (1<<RCC_RS_ENR);

	// Set the rs line to output
	RS_PORT->MODER &= ~(0b11 << (RS_PIN << 1));
	RS_PORT->MODER |= (0b01 << (RS_PIN << 1));

	// Enable the GPIO for the E port
	RCC->AHB1ENR |= (1<<RCC_E_ENR);

	// Set the e line to output
	E_PORT->MODER &= ~(0b11 << (E_PIN << 1));
	E_PORT->MODER |= (0b01 << (E_PIN << 1));


	// When initializing they recommend 15 ms delay until after vcc rises above 4.5V
	DWT_Delay_ms(15);

	// Set RS and RW for Writing (RW) Instructions (RS)
	setRW(0);
	setRS(0);

	// Function set see datasheet
	sendByte(0b00110000);

	// Datasheet recommends 4.1ms delay here
	DWT_Delay_us(4100);

	// Function set see datasheet
	sendByte(0b00110000);

	// Datasheet recommends 100us delay here
	DWT_Delay_us(100);

	// Function set see datasheet
	sendByte(0b00110000);

	// Function set, 4 bit mode, 2 lines, 8x5 dots
	sendInstruction(0b00111000);
	
	// Display off
	sendInstruction(0b00001000);

	// Display clear
	sendInstruction(0b00000001);

	// Entry set
	sendInstruction(0b00000110);

}

#else

/*
*	Initialize the display by instruction as explained in the datasheet
*/
void initDisplay(void)
{

	DWT_Delay_Init();

	

	// Enable the GPIO for the data port
	RCC->AHB1ENR |= (1<<RCC_DATA_ENR);

	// Set each of the data lines to outputs
	DATA_PORT->MODER &= ~(0b11 << (DB4 << 1)) & ~(0b11 << (DB5 << 1)) & ~(0b11 << (DB6 << 1)) & ~(0b11 << (DB7 << 1));
	DATA_PORT->MODER |= (0b01 << (DB4 << 1)) | (0b01 << (DB5 << 1)) | (0b01 << (DB6 << 1)) | (0b01 << (DB7 << 1));
	
	// Enable the GPIO for the RW port
	RCC->AHB1ENR |= (1<<RCC_RW_ENR);

	// Set the rw line to output
	RW_PORT->MODER &= ~(0b11 << (RW_PIN << 1));
	RW_PORT->MODER |= (0b01 << (RW_PIN << 1));

	// Enable the GPIO for the RS port
	RCC->AHB1ENR |= (1<<RCC_RS_ENR);

	// Set the rs line to output
	RS_PORT->MODER &= ~(0b11 << (RS_PIN << 1));
	RS_PORT->MODER |= (0b01 << (RS_PIN << 1));

	// Enable the GPIO for the E port
	RCC->AHB1ENR |= (1<<RCC_E_ENR);

	// Set the e line to output
	E_PORT->MODER &= ~(0b11 << (E_PIN << 1));
	E_PORT->MODER |= (0b01 << (E_PIN << 1));



	// When initializing they recommend 15 ms delay until after vcc rises above 4.5V
	DWT_Delay_ms(15);

	// Set RS and RW for Writing (RW) Instructions (RS)
	setRW(0);
	setRS(0);

	// Function set see data sheet
	sendNibble(0b0011);
	setE(0);
	setE(1);
	setE(0);

	// Datasheet recommends 4.1ms delay here
	DWT_Delay_us(4100);

	// Function set see data sheet
	sendNibble(0b0011);
	setE(0);
	setE(1);
	setE(0);

	// Datasheet recommends 100us delay here
	DWT_Delay_us(100);

	// This takes the form of two function sets
	// The first is another 0011 as the datasheet requires
	// The second is 0010 to set 4 bit mode
	sendInstruction(0b00110010);

	//Function set, 4 bit mode, 2 lines, 8x5 dots
	sendInstruction(0b00101000);
	
	// Display off
	sendInstruction(0b00001000);

	// Display clear
	sendInstruction(0b00000001);

	// Entry set
	sendInstruction(0b00000110);

	// Display mode starts with display off, cursor off, blinking off.
	displayMode = 0;



}

#endif

void clearDisplay(void)
{
	sendInstruction(0b00000001);
}

void returnHome(void)
{
	sendInstruction(0b00000010);
}

void entryModeSet(int incOrDec, int S)
{
	uint8_t instruction = (0b00000100 | (incOrDec << 1) | (S << 0));
	sendInstruction(instruction);
}

void displayControl(uint8_t displayOn, uint8_t cursorOn, uint8_t blinkingOn)
{
	displayMode = 0b1000;
	displayMode |= (displayOn << 2) | (cursorOn << 1) | (blinkingOn << 0);
	sendInstruction(displayMode);
}

void displayControlHelper()
{
	uint8_t instruction = (0b00001000 | displayMode);
	sendInstruction(instruction);
}

void displayOn()
{
	displayMode |= (1<<2);
	displayControlHelper();
}

void displayOff()
{
	displayMode &= ~(1<<2);
	displayControlHelper();
}

void cursorOn()
{
	displayMode |= (1<<1);
	displayControlHelper();
}

void cursorOff()
{
	displayMode &= ~(1<<1);
	displayControlHelper();
}

void blinkingOn()
{
	displayMode |= (1<<0);
	displayControlHelper();
}

void blinkingOff()
{
	displayMode &= ~(1<<0);
	displayControlHelper();
}

void cursorOrDisplayShift(int cOrD, int rOrL)
{
	uint8_t instruction = (0b00010000 | (cOrD << 3) | (rOrL << 2));
	sendInstruction(instruction);
}

void cursorShift(int rOrL)
{
	cursorOrDisplayShift(0, rOrL);
}

void displayShift(int rOrL)
{
	cursorOrDisplayShift(1, rOrL);
}

void cursorShiftRight()
{
	cursorOrDisplayShift(0, 1);
}

void cursorShiftLeft()
{
	cursorOrDisplayShift(0, 0);
}

void displayShiftRight()
{
	cursorOrDisplayShift(1, 1);
}

void displayShiftLeft()
{
	cursorOrDisplayShift(1, 0);
}

#ifndef FOUR_BIT_OPERATION

void functionSet(int lines, int font)
{
	int instruction = 0b00100000 | (1 << 4) | (lines << 3) | (font << 2);
	sendInstruction(instruction);	
}

void functionSet2Lines5By8()
{
	int instruction = 0b00100000 | (0 << 4) | (1 << 3) | (0 << 2);
	sendInstruction(instruction);
}

void functionSet1Line5By8()
{
	int instruction = 0b00100000 | (0 << 4) | (0 << 3) | (0 << 2);
	sendInstruction(instruction);
}

void functionSet2Lines5By10()
{
	int instruction = 0b00100000 | (0 << 4) | (1 << 3) | (1 << 2);
	sendInstruction(instruction);
}

void functionSet1Line5By10()
{
	int instruction = 0b00100000 | (0 << 4) | (0 << 3) | (1 << 2);
	sendInstruction(instruction);
}

#else

void functionSet(int lines, int font)
{
	int instruction = 0b00100000 | (0 << 4) | (lines << 3) | (font << 2);
	sendInstruction(instruction);
}

void functionSet2Lines5By8()
{
	int instruction = 0b00100000 | (0 << 4) | (1 << 3) | (0 << 2);
	sendInstruction(instruction);
}

void functionSet1Line5By8()
{
	int instruction = 0b00100000 | (0 << 4) | (0 << 3) | (0 << 2);
	sendInstruction(instruction);
}

void functionSet2Lines5By10()
{
	int instruction = 0b00100000 | (0 << 4) | (1 << 3) | (1 << 2);
	sendInstruction(instruction);
}

void functionSet1Line5By10()
{
	int instruction = 0b00100000 | (0 << 4) | (0 << 3) | (1 << 2);
	sendInstruction(instruction);
}

#endif

void lcdPrintString(char* string)
{
	for (int i = 0; string[i] != '\0'; i++)
	{
		writeDisplay(string[i]);
	}
}

void lcdPrintf(char *format, ...)
{
	va_list args;
	va_start(args, format);
	char string[LCD_COL_COUNT];
	vsnprintf(string, LCD_COL_COUNT, format, args);

	lcdPrintString(string);
}