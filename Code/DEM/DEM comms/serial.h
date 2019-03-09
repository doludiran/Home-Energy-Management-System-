/**
 ******************************************************************************
 * Name:    serial.h
 * Description: USART interface Configuration Initialization
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



extern int GLOBAL_BUFF_SIZE;
extern bool GLOBAL_DATA_RECEIVED;
extern uint16_t GLOBAL_USART_Received_Data[30];
extern int GLOBAL_CHAR_COUNTER;


void usart_init(void);
void usart_tx(uint16_t data);
uint16_t usart_rx(void);


