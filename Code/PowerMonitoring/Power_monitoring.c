#include "stm32f10x.h"
#include "Power_monitoring.h"
#include "ADC_INIT.h"
#include "xbee.h"


/* Function to enable clock and set the config and mode bits of port B to push pull output
Input: None
Output: None
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
}

//----------------------------------------------------------------------------------//

/* Function to read the voltage and current and calculate power
Input: none
Output: Power consumption (power)
*/
uint32_t powermonitoring()
{
		uint16_t voltage;
		uint16_t voltage_temp;
		uint16_t current;
		uint16_t current_temp;


		int pf = 1;
		uint32_t power_temp;
		uint32_t power;
	
     ADC_start(0); 						// channel 0 for Voltage
     voltage_temp  = Read_ADC();
/*
	Add code for converting it to the actual voltage ( i.e 120V)
	voltage = voltage_temp * corr_factor_voltage;
	
*/	
	
	   ADC_start(3); 						// channel 1 for Current
     current_temp = Read_ADC();	

/*
	Add code for converting it to the actual current( in Amps)
	current = current_temp * corr_factor_current; 
	
*/
		 power_temp = voltage * current * pf;
	
		 power = Power_Reading_Res(power_temp);
	
		 return power;
}

//----------------------------------------------------------------------------------//

/* Function to control the switching circuit
Input: none
Output: Pin PB0 toggled depending on the switching command
*/
void switching()
{
	int switch_on = 0x0001;
  int switch_off = 0x0002;
	// get the switch command from xbee function;
	uint16_t switch_command = xbee_recieve();
	
	if (switch_command == switch_on)
	{
	 GPIOB->ODR = GPIO_ODR_ODR0;
	 GPIOC->ODR ^= GPIO_ODR_ODR8;
	}
	if(switch_command == switch_off)
	{
	GPIOB->BSRR = SWITCH_OFF;
	GPIOC->ODR = ~GPIO_ODR_ODR8;
	}
}
