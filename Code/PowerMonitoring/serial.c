/**
 ******************************************************************************
 * Name:    serial.c
 * Description: USART interface Configuration Implementation
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

/**
* Name:           void usart_init()
* Paramaters:     none
* Description:    This function configures USART2
* Preconditions:  stm32f10x.h is included in project
* Postconditions: 
*/

void usart_init()
{
	
RCC->APB1ENR |= RCC_APB1ENR_USART2EN;
RCC->APB2ENR |=RCC_APB2ENR_IOPAEN|RCC_APB2ENR_AFIOEN;

GPIOA->CRL|=	GPIO_CRL_MODE2|GPIO_CRL_CNF2_1|GPIO_CRL_CNF3_0;
GPIOA->CRL &=	~GPIO_CRL_CNF2_0 & ~GPIO_CRL_MODE3;	

USART2->CR1 |= USART_CR1_UE;
USART2->BRR =0x9c4;
USART2->CR1|=USART_CR1_TE |USART_CR1_RE| USART_CR1_RXNEIE;
USART2->CR1 &= ~USART_CR1_OVER8 & ~USART_CR1_M & ~USART_CR1_PCE;
USART2->CR2 &= ~USART_CR2_STOP;	
NVIC->ISER[1] |= NVIC_ISER_SETENA_6;	
}

/**
* Name:           void usart_tx(uint16_t data)
* Paramaters:     none
* Description:    This function writes to serial interface
* Preconditions:  stm32f10x.h is included in project
* Postconditions: 
*/
void usart_tx(uint16_t data)
{
	while((USART2->SR & USART_SR_TXE)!= USART_SR_TXE)       //Wait for the TxE bit in USART2_SR to be 1
  { };
  USART2->DR = data;
	
}

/**
* Name:           uint16_t usart_rx()
* Paramaters:     none
* Description:    This function reads from serial interface
* Preconditions:  stm32f10x.h is included in project
* Postconditions: 
*/
uint16_t usart_rx()
{  while ((USART2->SR & USART_SR_RXNE)!=USART_SR_RXNE)
	{};
return USART2->DR;	
}

void USART2_IRQHandler()
{
	 if (GLOBAL_CHAR_COUNTER < GLOBAL_BUFF_SIZE)
		{ 
			GLOBAL_USART_Received_Data[GLOBAL_CHAR_COUNTER] = USART2->DR;
			GLOBAL_CHAR_COUNTER++;
		}
		
		if (GLOBAL_CHAR_COUNTER == GLOBAL_BUFF_SIZE)
		{
			GLOBAL_DATA_RECEIVED =true;
			GLOBAL_CHAR_COUNTER = 0;
		}	

}

