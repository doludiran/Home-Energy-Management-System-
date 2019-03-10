 /**
 ******************************************************************************
 * Name:    ledIO.c
 * Description: LED functions Implementation
 * Version: V1.0
 *  Author: Damilola Oludiran 
  
 *
 * This software is supplied "AS IS" without warranties of any kind.
 *
 *
 *----------------------------------------------------------------------------
 * History:
 *          V1.0 Initial Version by Damilola Oludiran
 *            
 *         
 *****************************************************************************
 */


#include "ledIO.h"


int BIT =0x1;
int LED_SHIFT_ON =7;
int LED_SHIFT_OFF =23;

/**
* Name:           void apbClockEnable()
* Paramaters:     none
* Description:    This function enables GPIO port clock
* Preconditions:  stm32f10x.h is included in project
* Postconditions: Clock enabled for Port B 
*/
void apbClockEnable()
{
	  RCC->APB2ENR |= RCC_APB2ENR_IOPCEN ;
}


/**
* Name:           void apbClockDisable()
* Paramaters:     none
* Description:    This function disables GPIO port clock
* Preconditions:  stm32f10x.h is included in project
* Postconditions: Clock enabled for Port B 
*/
void apbClockDisable()
{
	  RCC->APB2ENR &= ~RCC_APB2ENR_IOPBEN ;
}



/**
* Name:           void configMode()
* Paramaters:     none
* Description:    This function configures the LED ports 
* Preconditions:  stm32f10x.h is included in project
* Postconditions: Ports configured
*/
void configMode()
{
			
     GPIOC->CRH |= GPIO_CRH_MODE8 | GPIO_CRH_MODE9 | GPIO_CRH_MODE10 |GPIO_CRH_MODE11
                   | GPIO_CRH_MODE12 | GPIO_CRH_MODE13 | GPIO_CRH_MODE14 | GPIO_CRH_MODE15;
     GPIOC->CRH &= ~GPIO_CRH_CNF8 & ~GPIO_CRH_CNF9 & ~GPIO_CRH_CNF10 & ~GPIO_CRH_CNF11 
	                 & ~GPIO_CRH_CNF12 & ~GPIO_CRH_CNF13 & ~GPIO_CRH_CNF14 & ~GPIO_CRH_CNF15;
}


/**
* Name:           void resetConfigMode()
* Paramaters:     none
* Description:    This function resets LED port config 
* Preconditions:  stm32f10x.h is included in project
* Postconditions: ports reset
*/
void resetConfigMode()
{
     GPIOB->CRH &= GPIO_CRH_CNF8_0 & GPIO_CRH_CNF9_0 & GPIO_CRH_CNF10_0 & GPIO_CRH_CNF11_0
	                 & GPIO_CRH_CNF12_0 & GPIO_CRH_CNF13_0 & GPIO_CRH_CNF14_0 & GPIO_CRH_CNF15_0;
}

/**
* Name:           void turnLEDon(uint32_t led)
* Paramaters:     none
* Description:    This function turns on required led
* Preconditions:  stm32f10x.h is included in project
* Postconditions: LED on
*/
void turnLEDon(uint32_t led)
{
     GPIOB->BSRR |= BIT << (led + LED_SHIFT_ON);
}


/**
* Name:           void turnLEDallOn()
* Paramaters:     none
* Description:    This function turns on all leds
* Preconditions:  stm32f10x.h is included in project
* Postconditions: LEDs on
*/
void turnLEDallOn()
{
     GPIOB->BSRR |= GPIO_BSRR_BS8|GPIO_BSRR_BS9|GPIO_BSRR_BS10|GPIO_BSRR_BS11|GPIO_BSRR_BS12
				          |GPIO_BSRR_BS13|GPIO_BSRR_BS14|GPIO_BSRR_BS15;
}

/**
* Name:           void turnLEDallOff()
* Paramaters:     none
* Description:    This function turns off all leds
* Preconditions:  stm32f10x.h is included in project
* Postconditions: LEDs off
*/
void turnLEDallOff()
{
     GPIOB->BSRR |= GPIO_BSRR_BR8|GPIO_BSRR_BR9|GPIO_BSRR_BR10|GPIO_BSRR_BR11|GPIO_BSRR_BR12
				          |GPIO_BSRR_BR13|GPIO_BSRR_BR14|GPIO_BSRR_BR15;
}


/**
* Name:           void turnLEDoff(uint32_t led)
* Paramaters:     none
* Description:    This function turns off requored led
* Preconditions:  stm32f10x.h is included in project
* Postconditions: LED off
*/
void turnLEDoff(uint32_t led)
{
     GPIOB->BSRR |= BIT << (led + LED_SHIFT_OFF);
}

/**
* Name:           void getLEDstatus(uint32_t led)
* Paramaters:     none
* Description:    This function returns led status
* Preconditions:  stm32f10x.h is included in project
* Postconditions: LED on or off
*/
bool getLEDstatus(uint32_t led)
{	
		 if ((GPIOB->ODR & ( BIT << (led + LED_SHIFT_ON))) == ( BIT << (led + LED_SHIFT_ON)))
		 {return true;}
		 else 
		 {return false;} 
} 


