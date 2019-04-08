/**
// Code provided by Damilola for system integration
 ******************************************************************************
 * Name:    xbee.c
 * Description: XBee interface Configuration Implementation
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

#include"xbee.h"
/**
* Name:           void xbee_init()
* Paramaters:     none
* Description:    This function configures USART2 and xbee
* Preconditions:  stm32f10x.h is included in project
* Postconditions: 
*/

void xbee_init(void)
{
	usart_init();
	usart_tx(0x42);
}


/**
* Name:           xbee_send
* Paramaters:     uint16_t address, uint16_t data
* Description:    This function sends data to the xbee module
* Preconditions:  16 bit Destination Address and 16 bit Data
* Postconditions: 
*/
void xbee_send(uint16_t address, uint16_t current, uint16_t voltage)
{
	const uint16_t message_buff_size = 13;
	uint16_t message[message_buff_size];
	uint8_t checksum = 0;
	int i = 0;
	
	message[0] = 0x7E;
	message[1] = 0x00;
	message[2] = 0x09;
	message[3] = 0x01;
	message[4] = 0x00;
	message[5] = (address & 0xFF00) >> 8;
	message[6] = (address & 0xFF);
	message[7] = 0x00;
	message[8] = (current & 0xFF00) >> 8;
	message[9] = (current & 0xFF);
	message[10] = (voltage & 0xFF00) >> 8;
	message[11] = (voltage & 0xFF);
	
	for ( i = 3; i < message_buff_size - 1; i++)
	{checksum += message[i];}
	
	checksum = 0xFF -(checksum & 0xFF);
	
	message[12] = checksum;
	
	
	for ( i = 0; i < message_buff_size; i++)
	{usart_tx(message[i]);}
	
}

/**
* Name:           xbee_recieve
* Paramaters:     n/a
* Description:    This function retrieves data from the xbee module
* Preconditions:  n/a
* Postconditions: 16 bit data output
*/

uint16_t xbee_recieve(void)
{
	uint16_t data;
	uint16_t dataMSB;
	uint16_t dataLSB;

 if ((GLOBAL_DATA_RECEIVED == true) && (GLOBAL_USART_Received_Data[0] == 0x7E))
 {
	 dataMSB = (GLOBAL_USART_Received_Data[8] & 0xFF) << 8;
	 dataLSB = (GLOBAL_USART_Received_Data[9] & 0xFF);
	 data = dataMSB + dataLSB;
	 
	 GLOBAL_DATA_RECEIVED = false;
	 return data;
 }
 else{return 0;}
	
	
}

