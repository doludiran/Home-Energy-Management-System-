/**
// Code provided by Damilola for system integration
 ******************************************************************************
 * Name:    XBee.h
 * Description: XBee interface Configuration Initialization
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

#include"serial.h"

void xbee_init(void);
void xbee_send(uint16_t address, uint16_t current, uint16_t voltage);
uint16_t xbee_recieve(void);
