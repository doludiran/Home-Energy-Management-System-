#include"stdio.h"
#include"stm32f10x.h"
#include"serial.h"
#include"xbee.h"
#include"ledIO.h"

int GLOBAL_BUFF_SIZE = 11;
bool GLOBAL_DATA_RECEIVED =false;
uint16_t GLOBAL_USART_Received_Data[30];
int GLOBAL_CHAR_COUNTER = 0;


int i = 0;

uint16_t data[14] = {0x7e, 0x00, 0x0a, 0x01, 0x01, 0xff, 0xff, 0x00, 0x48, 0x65, 0x6c, 0x6c, 0x6f, 0x0b};

int main()
{
	xbee_init();
	apbClockEnable();
	configMode();
	
	while(1)
	{
//		xbee_send(0x00DC, 0x4567);
//		for (i=0; i < 500000; i++)
//		{}
		if(xbee_recieve() == 0x5890)
		{ GPIOC->ODR ^= GPIO_ODR_ODR8;}
			
	}
}	

