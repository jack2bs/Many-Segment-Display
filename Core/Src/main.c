#include <stm32g441xx.h>
#include "main.h"
#include "Lcd.h"
#include "usb_device.h"
#include "usbd_cdc_if.h"
#include "7Seg.h"
#include <stdio.h>


USBD_HandleTypeDef* usbHandler;
uint8_t rxBuf[64];
uint8_t txBuf[32] = "HELLO THERE FRIEND\n";

void gpioB_Init(void)
{
	// Enable the GPIO B Clock
	RCC->AHB2ENR |= (1<<RCC_AHB2ENR_GPIOBEN_Pos);

	// Set of PB9 to output
	GPIOB->MODER = 0x55555555;

	// Set PB9 High
	//GPIOB->BSRR |= (1<<GPIO_BSRR_BS9_Pos);

}

void gpioA_Init(void)
{
  	RCC->AHB2ENR |= (1<<RCC_AHB2ENR_GPIOAEN_Pos);
	GPIOA->MODER = 0;
	GPIOA->MODER = 0x55555555;
}

void mainRCCInit(void)
{
	// Turn on the HSE clock
	//RCC->CR |= (1<<RCC_CR_HSEON_Pos);

	// While the HSE is getting ready, set the correct number of wait states
	FLASH->ACR |= (0b11 << FLASH_ACR_LATENCY_Pos);

	// Wait for the HSE clock to be ready
	//while (!(RCC->CR & (1<<RCC_CR_HSERDY_Pos)));

  	RCC->CCIPR |= (0b10<<RCC_CCIPR_CLK48SEL_Pos);

	// Configure the PLL to 100mhz
	RCC->PLLCFGR |= (0b10 << RCC_PLLCFGR_PLLSRC_Pos) 
		| (0b11 << RCC_PLLCFGR_PLLM_Pos) 
		| (0b110000 << RCC_PLLCFGR_PLLN_Pos)
    	| (0b01 << RCC_PLLCFGR_PLLQ_Pos)
    	| (0b1 << RCC_PLLCFGR_PLLQEN_Pos);

	// Turn on the PLL and wait for it to be ready
	RCC->CR |= (1 << RCC_CR_PLLON_Pos);
	while (!(RCC->CR & (1<<RCC_CR_PLLRDY_Pos)));

	// Set the system clock as the output of the PLL
	RCC->CFGR |= (0b11 << RCC_CFGR_SW_Pos);
}

void contrastInit(void)
{
	// Enable the clock for DAC 1 and for GPIOA (so that A4 can be put in AF mode)
	RCC->AHB2ENR |= (1<<RCC_AHB2ENR_DAC1EN_Pos);

	// Enable Dac1 channel 1
	DAC1->CR |= (1<<DAC_CR_EN1_Pos);

	// Fill in the value for the dac to convert (Currently 64/255 which is equivalent to 3.3/4 V)
	DAC1->DHR8R1 |= (0b1000000<<DAC_DHR8R1_DACC1DHR_Pos);

	// Trigger the dac to make a conversion
	DAC1->SWTRIGR |= (1<<DAC_SWTRIGR_SWTRIG1_Pos);

}

void rtcInit(int sec, int min, int hour)
{
	

	// Enable the peripheral bus clk to the RTC
	RCC->APB1ENR1 |= (1<<RCC_APB1ENR1_PWREN_Pos);

	PWR->CR1 |= (1<<PWR_CR1_DBP_Pos);

	RCC->APB1ENR1 |= (1<<RCC_APB1ENR1_RTCAPBEN_Pos);

	

	

	//Enable the LSE and wait for it to work
	RCC->BDCR |= (0b11 << RCC_BDCR_LSEDRV_Pos);
	RCC->BDCR |= (1<<RCC_BDCR_LSEON_Pos);
	while (!(RCC->BDCR & (1<<RCC_BDCR_LSERDY_Pos))); 

	// Enable the LSI and wait for it to work
	//RCC->CSR |= (1<<RCC_CSR_LSION_Pos);
	//while (!(RCC->CSR & (1<<RCC_CSR_LSIRDY_Pos))); 

	GPIOB->BSRR |= (1<<GPIO_BSRR_BR9_Pos);

	// Select LSE for the RTC and Enable the RTC
	RCC->BDCR &= ~(0b11<<RCC_BDCR_RTCSEL_Pos);
	RCC->BDCR |= (0b01<<RCC_BDCR_RTCSEL_Pos);
	RCC->BDCR |= (1<<RCC_BDCR_RTCEN_Pos);

	// Get rid of the write protection
	RTC->WPR = 0xCA;
	RTC->WPR = 0x53;
	
	// Put the RTC into initialization mode
	RTC->ICSR |= (1<<RTC_ICSR_INIT_Pos);
	while (!(RTC->ICSR & (1<<RTC_ICSR_INITF_Pos)));

	// Set the current time and date
	RTC->CR |= (1<<RTC_CR_FMT_Pos);

	RTC->TR = 0x0;
	RTC->TR = (0b1<<RTC_TR_PM_Pos) | ((hour / 10)<<RTC_TR_HT_Pos) | ((hour % 10)<<RTC_TR_HU_Pos) | ((min / 10)<<RTC_TR_MNT_Pos) | ((min % 10)<<RTC_TR_MNU_Pos) | ((sec / 10)<<RTC_TR_ST_Pos) | ((sec % 10)<<RTC_TR_SU_Pos);

	//RTC->PRER = (127 << RTC_PRER_PREDIV_A_Pos) | (249 << RTC_PRER_PREDIV_S_Pos);

	//RTC->DR |= ();

	// Exit initialization mode
	RTC->ICSR &= ~(1<<RTC_ICSR_INIT_Pos);
	while ((RTC->ICSR & (1<<RTC_ICSR_INITF_Pos)));

	// Cannot read until RSF is set
	while (!(RTC->ICSR & (1<<RTC_ICSR_RSF_Pos)));

	// Reenable write protection
	RTC->WPR = 0x00;

	TAMP->CR1 = 0x00;

}

int8_t checkSetTime(void)
{
	if (rxBuf[2] != ':' || rxBuf[5] != ':')
	{
		return 0;
	}

	for (int i = 0; i < 8; i++)
	{
		if (i == 2)
			continue;
		if (i == 5)
			continue;
		if (rxBuf[i] > 57 || rxBuf[i] < 48)
		{
			return 0;
		}
		rxBuf[i] -= 48;
	}

	// RCC->BDCR=0;
	// RCC->BDCR |= RCC_BDCR_BDRST;
	// RCC->BDCR &= ~RCC_BDCR_BDRST;

	rtcInit(rxBuf[6] * 10 + rxBuf[7], rxBuf[3] * 10 + rxBuf[4], rxBuf[0] * 10 + rxBuf[1]);

	// RCC->BDCR = 0;
	// RCC->BDCR |= RCC_BDCR_BDRST;
	// RCC->BDCR &= ~RCC_BDCR_BDRST;

	// // Disable write protection
	// RTC->WPR = 0xCA;
	// RTC->WPR = 0x53;
	
	// // Put the RTC into initialization mode
	// RTC->ICSR |= (1<<RTC_ICSR_INIT_Pos);
	// while (!(RTC->ICSR & (1<<RTC_ICSR_INITF_Pos)));

	// // Set time (CHANGE)
	// RTC->TR = 0x0;
	// //RTC->TR = (0b1<<RTC_TR_PM_Pos) | (1<<RTC_TR_HT_Pos) | (2<<RTC_TR_HU_Pos) | (0<<RTC_TR_MNT_Pos) | (0<<RTC_TR_MNU_Pos);

	// // Exit initialization mode
	// RTC->ICSR &= ~(1<<RTC_ICSR_INIT_Pos);
	// while ((RTC->ICSR & (1<<RTC_ICSR_INITF_Pos)));

	// // Cannot read until RSF is set
	// while (!(RTC->ICSR & (1<<RTC_ICSR_RSF_Pos)));

	// // Reenable write protection
	// RTC->WPR = 0x00;


	return 1;

}

int main(void)
{

	HAL_Init();

	// Initialize the clock
	mainRCCInit();

	// Initialize GPIO Pin B
	gpioB_Init();
	gpioA_Init();

	RCC->APB1ENR1 |= (1<<RCC_APB1ENR1_USBEN_Pos);
	


	// Initialize the display
	//initDisplay();
	//functionSet2Lines5By8();
	//displayControl(1,1,0);
	//entryModeSet(1,0);
	//contrastInit();

	GPIOB->BSRR |= (1<<GPIO_BSRR_BS9_Pos);

	// int sec = ((RTC->TR & (0b1111<<RTC_TR_SU_Pos)) >> RTC_TR_SU_Pos) + ((RTC->TR & (0b111<<RTC_TR_ST_Pos)) >> RTC_TR_ST_Pos) * 10;
	// int min = ((RTC->TR & (0b1111<<RTC_TR_MNU_Pos)) >> RTC_TR_MNU_Pos) + ((RTC->TR & (0b111<<RTC_TR_MNT_Pos)) >> RTC_TR_MNT_Pos) * 10;
	// int hour = ((RTC->TR & (0b1111<<RTC_TR_HU_Pos)) >> RTC_TR_HU_Pos) + ((RTC->TR & (0b11<<RTC_TR_HT_Pos)) >> RTC_TR_HT_Pos) * 10;
	//rtcInit(sec, min, hour);
	//rtcInit();
	usbHandler = MX_USB_Device_Init(rxBuf, txBuf);
	//lcdPrintf("Test %d", 100);

  	//GPIOB->BSRR |= (1<<GPIO_BSRR_BR9_Pos);
	HAL_Delay(100);

  	// int sec = ((RTC->TR & (0b1111<<RTC_TR_SU_Pos)) >> RTC_TR_SU_Pos) + ((RTC->TR & (0b111<<RTC_TR_ST_Pos)) >> RTC_TR_ST_Pos) * 10;
	// int min = ((RTC->TR & (0b1111<<RTC_TR_MNU_Pos)) >> RTC_TR_MNU_Pos) + ((RTC->TR & (0b111<<RTC_TR_MNT_Pos)) >> RTC_TR_MNT_Pos) * 10;
	// int hour = ((RTC->TR & (0b1111<<RTC_TR_HU_Pos)) >> RTC_TR_HU_Pos) + ((RTC->TR & (0b11<<RTC_TR_HT_Pos)) >> RTC_TR_HT_Pos) * 10;
	//lcdPrintf("%0.2d:%0.2d:%0.2d     ", hour, min, sec);
	//returnHome();

	while (1)
	{
		int sec = ((RTC->TR & (0b1111<<RTC_TR_SU_Pos)) >> RTC_TR_SU_Pos) + ((RTC->TR & (0b111<<RTC_TR_ST_Pos)) >> RTC_TR_ST_Pos) * 10;
		int min = ((RTC->TR & (0b1111<<RTC_TR_MNU_Pos)) >> RTC_TR_MNU_Pos) + ((RTC->TR & (0b111<<RTC_TR_MNT_Pos)) >> RTC_TR_MNT_Pos) * 10;
		int hour = ((RTC->TR & (0b1111<<RTC_TR_HU_Pos)) >> RTC_TR_HU_Pos) + ((RTC->TR & (0b11<<RTC_TR_HT_Pos)) >> RTC_TR_HT_Pos) * 10;

		checkSetTime();

		for (int i = 0; i < 32; i++)
		{
			txBuf[i] = rxBuf[i];
		}
		sprintf(txBuf, "%d:%d:%d\t", hour, min, sec);
		txBuf[14] = (min % 10) + 48;
		txBuf[15] = (sec % 10) + 48;
		txBuf[16] = (RCC->BDCR & (1<<RCC_BDCR_LSERDY_Pos));
		txBuf[31] = '\n';
		CDC_Transmit_FS(txBuf, 32);





		// DELETE THIS EVENTUALLY
		HAL_Delay(250);
		

		

		updateDisplayWithTime(hour, min);
		setDisplay();

		//GPIOB->ODR = 0b0111000011111111;
		//HAL_Delay(5);

		//lcdPrintf("%0.2d:%0.2d:%0.2d     ", hour, min, sec);
		//returnHome();
	}
	
}

void Error_Handler(void)
{
  /* USER CODE BEGIN Error_Handler_Debug */
  /* User can add his own implementation to report the HAL error return state */
  __disable_irq();
  while (1)
  {
  }
  /* USER CODE END Error_Handler_Debug */
}
