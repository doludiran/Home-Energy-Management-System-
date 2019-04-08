/**
// Header format used with permission from Damilola Oludiran
 ******************************************************************************
 * Name: ADC_INIT.c
 * Description: ADC initialization and other ADC functions
 * Version: V1.0
 * Author: Bikramjit Saini 
  
 *
 * This software is supplied "AS IS" without warranties of any kind.
 *
 *
 *----------------------------------------------------------------------------
 * History:
 *          V1.0 Initial Version by Bikramjit Saini
 *            
 *         
 *****************************************************************************
 */

#include <stdint.h>

void Init_ADC(void);
void ADC_start(int channel);
int Power_Reading_Res(uint16_t value);
int Read_ADC(void);
void delay(uint32_t count);
