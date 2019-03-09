 /**
 ******************************************************************************
 * Name:    ledIO.h
 * Description: LED functions Initialization
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

#include <stdbool.h>
#include "stm32f10x.h"



void apbClockEnable(void);
void configMode(void);
void turnLEDon(uint32_t led);
void turnLEDoff(uint32_t led);
bool getLEDstatus(uint32_t led);
void turnLEDallOn(void);
void turnLEDallOff(void);


