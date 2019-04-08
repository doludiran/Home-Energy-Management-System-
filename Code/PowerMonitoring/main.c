/**
// Header format used with permission from Damilola Oludiran
 ******************************************************************************
 * Name: ADC_INIT.c
 * Description: Data from CCU is recieved and appropriate functions are called 
                according to that data
 * Version: V1.0
 * Author: Bikramjit Saini & Damilola Oludiran (Integration Code) 
  
 *
 * This software is supplied "AS IS" without warranties of any kind.
 *
 *
 *----------------------------------------------------------------------------
 * History:
 *          V1.0 Initial Version by Bikramjit Saini & Damilola Oludiran (Integration Code) 
 *            
 *         
 *****************************************************************************
 */
 
#include "clocks.h"
#include "stm32f10x.h"
#include "ADC_INIT.h"
#include "Power_monitoring.h"
#include "stdio.h"
#include "xbee.h"
#include"systick.h"

int GLOBAL_BUFF_SIZE = 11;
bool GLOBAL_DATA_RECEIVED =false;
bool GLOBAL_PWR_SEND;
uint16_t GLOBAL_USART_Received_Data[30];
int GLOBAL_CHAR_COUNTER = 0;
int i = 0;


int main(void)
{
	int i = 0;
	uint16_t data;
	uint16_t turn_on = 0x5890; // expected switching signal from CCU - Relay on
  uint16_t turn_off = 0x5899; // expected switching signal form CCU - Relay off
	clockInit();    // Initialize system clock
	Init_ADC();     // Initialize the ADC subsystem
	switch_enable ();// Initialize the switching pin
	xbee_init(); // Initialize X-bee
	SysTick_Init();

	while(1)
	{
		data = xbee_recieve();

		if( data == turn_on)
		{ 
			switch_on();
			GPIOC->ODR ^= GPIO_ODR_ODR8;  // LED for Switching Check
		}
		
		else if(data == turn_off)
		{ 
			switch_off();
	  } 
		
		// if the flag is set by systick timer. Used to control the rate of data transmission
		if (GLOBAL_PWR_SEND == true)
		{
			i++;
			GLOBAL_PWR_SEND = false;
		}
		
		if (i == 5)
		{
			GPIOC->ODR ^= GPIO_ODR_ODR9; // LED for Power monitoring data transmission check
		  powermonitoring();
		  i=0;
		}
		
		delay(500000);
	}
}

