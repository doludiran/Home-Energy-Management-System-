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
	uint16_t turn_on = 0x5890;
  uint16_t turn_off = 0x5899;
	clockInit();    // Initialize system clock
	Init_ADC();     // Initialize the ADC subsystem
	switch_enable ();
	xbee_init();
	SysTick_Init();

	while(1)
	{
			data = xbee_recieve();

		if( data == turn_on)
		{ 
			switch_on();
			GPIOC->ODR ^= GPIO_ODR_ODR8; 
			
		}
		
		else if(data == turn_off)
		{ 
		switch_off();
	  } 
			
		if (GLOBAL_PWR_SEND == true)
		{
			i++;
			GLOBAL_PWR_SEND = false;
		}
		
		if (i == 5)
		{
		GPIOC->ODR ^= GPIO_ODR_ODR9; 
		 powermonitoring();
		 i=0;
		}
		delay(500000);
	}
}

