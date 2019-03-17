//#include "ADC_Init.h"
#include "stm32f10x.h"
#include "IOdef.h"
#include "ADC_INIT.h"
 
 /* Function to initialize the ADC system on STM32F100RB
Input: none
Return: none
 */
 void Init_ADC(void)
{
		// enable clock for IO port A and ADC1 interface
	RCC->APB2ENR |=  RCC_APB2ENR_IOPAEN | RCC_APB2ENR_ADC1EN;

		// configure port A for analog input
		//GPIOA -> CRL |= GPIO_CRL_MODE1;
		//GPIOA -> CRL &= ~GPIO_CRL_CNF1;
		
	GPIOA->CRL &= ~(GPIO_CRL_CM0 | GPIO_CRL_CM1 ); 
	GPIOA->CRL |= (GPIO_CRL_CM0_AN | GPIO_CRL_CM1_AN);

		
	// Calibrate ADC
	ADC1-> CR2 |= ADC_CR2_CAL ;

	// turn ADC 'on'
	ADC1-> CR2 |=	ADC_CR2_ADON;

	//select sampling time 
	ADC1-> SMPR2 |= ((uint32_t)0x0000000F) | ((uint32_t)0x00000030); 
}


//----------------------------------------------------------------------------------//


/* Function to select the ADC channel
Input: Integer value corresponding to the channel to be used
Return: None
*/
void ADC_start(int channel)
{ 
	// Selecting channel 
	ADC1->SMPR2 |= 0X3f;
	
	ADC1->SQR3 &= ~ADC_SQR3_SQ1;
	ADC1 -> SQR3 = channel; 
	
	// Start the conversion	
	ADC1-> CR2 = ADC_CR2_ADON; 
	delay(2000);
}


//----------------------------------------------------------------------------------//


/* Function to read the ADC data
Input: none
Return: integer value
*/
int Read_ADC()
{	
	while((ADC1->SR & ADC_SR_EOC) != ADC_SR_EOC)
	{
	}
	
	return (ADC1->DR & ADC_DR_DATA);
}


//----------------------------------------------------------------------------------//


/* Function to convert Raw ADC data to a voltage value
Input: Raw ADC value read by Read_ADC() function
Return: integer value
*/
int Power_Reading_Res(uint16_t value)
{
	int val = (3300*value)/4095;   
																								
	return (val);		
}


//----------------------------------------------------------------------------------//



/* Function to add a delay
Input: 32 bit integer for delay counter (12000 will give 2 ms delay)
Return: none
References: Provided by Dave Duguid in ENEL 387 Lab
*/
void delay(uint32_t count)
{
	int i=0;
	for(i=0; i< count; ++i)
	{
	}
}