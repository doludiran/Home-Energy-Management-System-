/**
// Header format used with permission from Damilola Oludiran
 ******************************************************************************
 * Name: Power-monitoring.c
 * Description: Functions for power monitoring and switching the electric load on/off
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

#define SWITCH_ON	0X00000001 //
#define SWITCH_OFF 0X00010000 //

void switch_enable (void);
void powermonitoring(void);

void switch_on(void);
void switch_off(void);
