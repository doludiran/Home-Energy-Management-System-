#include <stdint.h>


//#define PIN9_OFF	0X00000200 //
//#define PIN9_ON 0x02000000 //
// 
//#define PIN8_ON	0x00000100 //
//#define PIN8_OFF	0x01000000 //

//#define PIN7_OFF	0x00000080 //
//#define PIN7_ON	0x00800000 //

//#define PIN6_OFF	0x00000040 //
//#define PIN6_ON	0x00400000 //

//#define PIN12_OFF	0x00001000 //
//#define PIN12_ON	0x10000000 //

void Init_ADC(void);
void ADC_start(int channel);
int Power_Reading_Res(uint16_t value);
int Read_ADC();
void delay(uint32_t count);