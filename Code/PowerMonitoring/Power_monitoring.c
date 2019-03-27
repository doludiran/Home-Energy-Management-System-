#include "stm32f10x.h"
#include "Power_monitoring.h"
#include "ADC_INIT.h"
#include "xbee.h"

extern bool GLOBAL_PWR_SEND;

/*
  Purpose: Enable clock and set the config and mode bits of port B to push pull output
  Argument(s): N/A
  Precondition(s): N/A
  Returns: N/A
  Side Effect: N/A 
*/

void switch_enable ()
{
	// enable the clock to Port B
	 RCC->APB2ENR |= RCC_APB2ENR_IOPBEN |RCC_APB2ENR_IOPCEN;

	// output mode, max speed 50 MHz
	// configuration: General purpose output push pull
	 GPIOB->CRL |= GPIO_CRL_MODE0;
	 GPIOB->CRL &= ~GPIO_CRL_CNF0;
	 GPIOC->CRH |= GPIO_CRH_MODE8;
	 GPIOC->CRH &= ~GPIO_CRH_CNF8;
	 GPIOC->CRH |= GPIO_CRH_MODE9;
	 GPIOC->CRH &= ~GPIO_CRH_CNF9;
}

//----------------------------------------------------------------------------------//

/*
  Purpose: Read the voltage and current from ADC, convert it to equivalent voltage and send it to CCU via XBEE
  Argument(s): N/A
  Precondition(s): N/A
  Returns: N/A
  Side Effect: N/A 
*/

void powermonitoring()
{
		uint16_t voltage;
	  int calibration_factor = 10;
		uint16_t voltage_temp;
		uint16_t current;
		uint16_t current_temp;
	
     ADC_start(0); 						// channel 0 for Voltage
     voltage_temp  = Read_ADC();
	   voltage = Power_Reading_Res(voltage_temp);
	 
	   ADC_start(1); 						// channel 1 for Current
     current_temp = Read_ADC();	
     current = Power_Reading_Res(current_temp);
		 delay(6000);
		 xbee_send(0xFFFF,current, voltage); 
		 
		 
}

//----------------------------------------------------------------------------------//

/*
  Purpose: Turn the GPIO pin PB0 high to turn 'on' the switching circuit
  Argument(s): N/A
  Precondition(s): N/A
  Returns: N/A
  Side Effect: N/A 
*/

void switch_on()
{
	GPIOB->BSRR = SWITCH_ON;
}

/*
  Purpose: Turn the GPIO pin PB0 low to turn 'off' the switching circuit
  Argument(s): N/A
  Precondition(s): N/A
  Returns: N/A
  Side Effect: N/A 
*/


void switch_off()
{
	GPIOB->BSRR = SWITCH_OFF;
}
//	{
//	 GPIOB->ODR = GPIO_ODR_ODR0;
//	 GPIOC->ODR ^= GPIO_ODR_ODR8;
//	//}GPIOC->ODR = ~GPIO_ODR_ODR8;


