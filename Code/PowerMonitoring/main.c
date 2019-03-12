#include "clocks.h"
#include "stm32f10x.h"
#include "ADC_INIT.h"
#include "Power_monitoring.h"
#include "stdio.h"
#include "xbee.h"

int GLOBAL_BUFF_SIZE = 11;
bool GLOBAL_DATA_RECEIVED =false;
uint16_t GLOBAL_USART_Received_Data[30];
int GLOBAL_CHAR_COUNTER = 0;
int i = 0;
int main(void)
{
	int i = 0;
	clockInit();    // Initialize system clock
	Init_ADC();     // Initialize the ADC subsystem
	switch_enable ();
	xbee_init();
	while(1)
	{
	 //switching();
   delay(12000);
		//		xbee_send(0x00DC, 0x4567);
//		for (i=0; i < 500000; i++)
//		{}
//		if(xbee_recieve() == 0x0001)
//		{ GPIOC->ODR ^= GPIO_ODR_ODR8;}
//		if(xbee_recieve() == 0x0)
//		{ GPIOC->ODR ^= GPIO_ODR_ODR9;}
//		for (i=0; i < 500000; i++)
//   	{}
	}
}
