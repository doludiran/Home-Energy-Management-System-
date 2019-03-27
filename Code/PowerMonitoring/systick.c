/**
// Code provided by Damilola for system integration
 ******************************************************************************
 * Name:    systick.c
 * Description: SysTick Timer Implementation
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
#include"systick.h"
/**
* Name:           void SysTick_Init()
* Paramaters:     none
* Description:    This function configures systick
* Preconditions:  stm32f10x.h is included in project
* Postconditions: 
*/
void SysTick_Init(void)
{
  SysTick->CTRL &= 0x0;
	SysTick->VAL &= 0x0;
	SysTick->LOAD |= 5000000*(SysTick->CALIB & SysTick_CALIB_TENMS);
	SysTick->CTRL |= SysTick_CTRL_ENABLE | SysTick_CTRL_TICKINT | SysTick_CTRL_CLKSOURCE;
	
}

void SysTick_Handler(void)
{
	GLOBAL_PWR_SEND = true;
}



