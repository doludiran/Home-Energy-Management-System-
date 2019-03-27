/**
// Code provided by Damilola for system integration
 ******************************************************************************
 * Name:    systick.h
 * Description: systick timer initialization
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


#include"stm32f10x.h"
#include<stdbool.h>


extern bool GLOBAL_PWR_SEND;

void SysTick_Init(void);
void SysTick_Handler(void);


