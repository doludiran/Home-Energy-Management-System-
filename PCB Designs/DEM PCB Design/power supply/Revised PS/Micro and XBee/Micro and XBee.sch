EESchema Schematic File Version 4
LIBS:Micro and XBee-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector:Conn_01x06_Female J4
U 1 1 5C4BCA9D
P 6200 4400
F 0 "J4" V 6047 4648 50  0000 L CNN
F 1 "Conn_01x06_Female" V 6138 4648 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x06_P2.54mm_Vertical" H 6200 4400 50  0001 C CNN
F 3 "~" H 6200 4400 50  0001 C CNN
	1    6200 4400
	0    -1   -1   0   
$EndComp
$Comp
L XB24CDMSIT-001:XB24CDMSIT-001 U2
U 1 1 5C50AA05
P 8900 2000
F 0 "U2" H 8900 2000 50  0001 L BNN
F 1 "XB24CDMSIT-001" H 8900 2000 59  0001 L BNB
F 2 "XB24CDMPIT-001:DIP-20" H 8900 2000 50  0001 L BNN
F 3 "None" H 8900 2000 50  0001 L BNN
F 4 "Digi International" H 8900 2000 50  0001 L BNN "Field4"
F 5 "Xbee S2c Digimesh 2.4 Th Rpsma" H 8900 2000 50  0001 L BNN "Field5"
F 6 "Module Digi International" H 8900 2000 50  0001 L BNN "Field6"
F 7 "Unavailable" H 8900 2000 50  0001 L BNN "Field7"
F 8 "XB24CDMSIT-001" H 8900 2000 50  0001 L BNN "Field8"
	1    8900 2000
	1    0    0    -1  
$EndComp
$Comp
L 282836-3:282836-3 J1
U 1 1 5C50BAE6
P 3600 1700
F 0 "J1" H 3545 1333 50  0000 C CNN
F 1 "282836-3" H 3545 1424 50  0000 C CNN
F 2 "282836-3:TE_282836-3" H 3600 1700 50  0001 L BNN
F 3 "A98077-ND" H 3600 1700 50  0001 L BNN
F 4 "https://www.te.com/usa-en/product-282836-3.html?te_bu=Cor&te_type=disp&te_campaign=seda_glo_cor-seda-global-disp-prtnr-fy19-seda-model-bom-cta_sma-317_1&elqCampaignId=32493" H 3600 1700 50  0001 L BNN "Field4"
F 5 "282836-3" H 3600 1700 50  0001 L BNN "Field5"
F 6 "None" H 3600 1700 50  0001 L BNN "Field6"
F 7 "282836-3" H 3600 1700 50  0001 L BNN "Field7"
F 8 "Compliant with Exemptions" H 3600 1700 50  0001 L BNN "Field8"
F 9 "https://www.digikey.ca/product-detail/en/te-connectivity-amp-connectors/282836-3/A98077-ND/1826940?utm_source=snapeda&utm_medium=aggregator&utm_campaign=symbol" H 3600 1700 50  0001 L BNN "Field9"
F 10 "TERMI-BLOK PCB MOUNT 90 3P." H 3600 1700 50  0001 L BNN "Field10"
F 11 "TE Connectivity" H 3600 1700 50  0001 L BNN "Field11"
	1    3600 1700
	-1   0    0    1   
$EndComp
$Comp
L RFB-0505S:RFB-0505S UO1
U 1 1 5C5200B9
P 3600 2500
F 0 "UO1" H 3600 2867 50  0000 C CNN
F 1 "RFB-0505S" H 3600 2776 50  0000 C CNN
F 2 "RFB-0505S:RFB-0505S" H 3600 2500 50  0001 L BNN
F 3 "Unavailable" H 3600 2500 50  0001 L BNN
F 4 "RFB-0505S" H 3600 2500 50  0001 L BNN "Field4"
F 5 "None" H 3600 2500 50  0001 L BNN "Field5"
F 6 "SIP-6 Recom Power" H 3600 2500 50  0001 L BNN "Field6"
F 7 "RFB Series 1 W 5 V Input 5 V Output 1 kVDC Isolated DC/DC-Converter - SIP7" H 3600 2500 50  0001 L BNN "Field7"
F 8 "Recom Power" H 3600 2500 50  0001 L BNN "Field8"
	1    3600 2500
	1    0    0    -1  
$EndComp
Text GLabel 3100 2400 0    50   Input ~ 0
3.3V1
Text GLabel 5400 1400 0    50   Input ~ 0
GND1
Text GLabel 7000 1400 2    50   Input ~ 0
GND1
Text GLabel 5400 4100 0    50   Input ~ 0
GND1
Text GLabel 7000 4100 2    50   Input ~ 0
GND1
Text GLabel 3100 2600 0    50   Input ~ 0
GND1
Text GLabel 4100 2400 2    50   Input ~ 0
3.3V2
Text GLabel 4100 2600 2    50   Input ~ 0
GND2
Text GLabel 3800 1600 2    50   Input ~ 0
3.3V1
Text GLabel 3800 1700 2    50   Input ~ 0
GND1
Text GLabel 3800 1800 2    50   Input ~ 0
PA1
$Comp
L 87224-6:87224-6 J5
U 1 1 5C5235A9
P 3500 3700
F 0 "J5" V 3348 4130 50  0000 L CNN
F 1 "87224-6" V 3439 4130 50  0000 L CNN
F 2 "87224-6:TE_87224-6" H 3500 3700 50  0001 L BNN
F 3 "Connector" H 3500 3700 50  0001 L BNN
F 4 "87224-6" H 3500 3700 50  0001 L BNN "Field4"
F 5 "2.54 mm[.1 in]" H 3500 3700 50  0001 L BNN "Field5"
F 6 "None" H 3500 3700 50  0001 L BNN "Field6"
F 7 "https://www.te.com/usa-en/product-87224-6.html?te_bu=Cor&te_type=disp&te_campaign=seda_glo_cor-seda-global-disp-prtnr-fy19-seda-model-bom-cta_sma-317_1&elqCampaignId=32493" H 3500 3700 50  0001 L BNN "Field7"
F 8 "06 MODII HDR SRST UNSHRD .100" H 3500 3700 50  0001 L BNN "Field8"
F 9 "6" H 3500 3700 50  0001 L BNN "Field9"
F 10 "TE Connectivity" H 3500 3700 50  0001 L BNN "Field10"
F 11 "87224-6" H 3500 3700 50  0001 L BNN "Field11"
F 12 "None" H 3500 3700 50  0001 L BNN "Field12"
F 13 "Unavailable" H 3500 3700 50  0001 L BNN "Field13"
	1    3500 3700
	0    1    1    0   
$EndComp
Text GLabel 7000 3500 2    50   Input ~ 0
PA9
Text GLabel 8300 1700 0    50   Input ~ 0
PA10
Text GLabel 7000 3600 2    50   Input ~ 0
PA8
Text GLabel 8300 1800 0    50   Input ~ 0
PA11
Text GLabel 3300 3300 1    50   Input ~ 0
3.3V1
Text GLabel 3400 3300 1    50   Input ~ 0
GND1
Text GLabel 3600 3300 1    50   Input ~ 0
3.3V2
Text GLabel 3500 3300 1    50   Input ~ 0
GND2
Text GLabel 3700 3300 1    50   Input ~ 0
PA2
Text GLabel 3800 3300 1    50   Input ~ 0
PA3
Text GLabel 5400 3000 0    50   Input ~ 0
PA2
Text GLabel 5400 3100 0    50   Input ~ 0
PA3
Text GLabel 8300 1600 0    50   Input ~ 0
3.3V1
Text GLabel 8300 2500 0    50   Input ~ 0
GND1
Text GLabel 7000 1700 2    50   BiDi ~ 0
PB9
Text GLabel 5400 1600 0    50   Input ~ 0
3.3V1
Text GLabel 5400 1700 0    50   BiDi ~ 0
VBAT
Text GLabel 5400 1800 0    50   BiDi ~ 0
PC13
Text GLabel 5400 1900 0    50   BiDi ~ 0
PC14
Text GLabel 5400 2000 0    50   BiDi ~ 0
PC15
Text GLabel 5400 2100 0    50   BiDi ~ 0
PD0
Text GLabel 5400 2200 0    50   BiDi ~ 0
PD1
Text GLabel 5400 2300 0    50   BiDi ~ 0
RST
Text GLabel 5400 2400 0    50   BiDi ~ 0
PC0
Text GLabel 5400 2500 0    50   BiDi ~ 0
PC1
Text GLabel 5400 2600 0    50   BiDi ~ 0
PC2
Text GLabel 5400 2700 0    50   BiDi ~ 0
PC3
Text GLabel 5400 2800 0    50   BiDi ~ 0
PA0
Text GLabel 5400 2900 0    50   BiDi ~ 0
PA1
Text GLabel 5400 3300 0    50   BiDi ~ 0
PA5
Text GLabel 5400 3200 0    50   BiDi ~ 0
PA4
Text GLabel 5400 3500 0    50   Input ~ 0
PA7
Text GLabel 5400 3400 0    50   BiDi ~ 0
PA6
Text GLabel 5400 3700 0    50   Input ~ 0
PC5
Text GLabel 5400 3600 0    50   BiDi ~ 0
PC4
Text GLabel 5400 3900 0    50   Input ~ 0
PB1
Text GLabel 5400 3800 0    50   BiDi ~ 0
PB0
Text GLabel 5400 4000 0    50   Input ~ 0
PB2
$Comp
L Connector:Conn_01x28_Female J2
U 1 1 5C53380A
P 5600 2700
F 0 "J2" H 5628 2630 50  0001 L CNN
F 1 "Conn_01x28_Female" H 5627 2585 50  0001 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x28_P2.54mm_Vertical" H 5600 2700 50  0001 C CNN
F 3 "~" H 5600 2700 50  0001 C CNN
	1    5600 2700
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x28_Female J3
U 1 1 5C534306
P 6800 2800
F 0 "J3" H 6694 1267 50  0001 C CNN
F 1 "Conn_01x28_Female" H 6827 2685 50  0001 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x28_P2.54mm_Vertical" H 6800 2800 50  0001 C CNN
F 3 "~" H 6800 2800 50  0001 C CNN
	1    6800 2800
	-1   0    0    1   
$EndComp
Text GLabel 7000 1600 2    50   Input ~ 0
5V
Text GLabel 7000 1800 2    50   BiDi ~ 0
PB8
Text GLabel 7000 1900 2    50   BiDi ~ 0
BOOT
Text GLabel 7000 2000 2    50   BiDi ~ 0
PB7
Text GLabel 7000 2100 2    50   BiDi ~ 0
PB6
Text GLabel 7000 2200 2    50   BiDi ~ 0
PB5
Text GLabel 7000 2300 2    50   BiDi ~ 0
PB4
Text GLabel 7000 2400 2    50   BiDi ~ 0
PB3
Text GLabel 7000 2500 2    50   BiDi ~ 0
PD2
Text GLabel 7000 2600 2    50   BiDi ~ 0
PC12
Text GLabel 7000 2700 2    50   BiDi ~ 0
PC11
Text GLabel 7000 2800 2    50   BiDi ~ 0
PC10
Text GLabel 7000 2900 2    50   BiDi ~ 0
PA15
Text GLabel 7000 3000 2    50   BiDi ~ 0
PA14
Text GLabel 7000 3100 2    50   BiDi ~ 0
PA13
Text GLabel 7000 3200 2    50   BiDi ~ 0
PA12
Text GLabel 7000 3300 2    50   BiDi ~ 0
PA11
Text GLabel 7000 3400 2    50   BiDi ~ 0
PA10
Text GLabel 7000 3700 2    50   BiDi ~ 0
PC9
Text GLabel 7000 3800 2    50   BiDi ~ 0
PC8
Text GLabel 7000 3900 2    50   BiDi ~ 0
PC7
Text GLabel 7000 4000 2    50   BiDi ~ 0
PC6
Text Notes 5700 2000 0    71   ~ 14
  STM32F100RB \nDISCOVERY BOARD
Text Notes 8700 1600 0    59   ~ 12
DIGI XBee\n
Wire Notes Line
	5600 1400 6800 1400
Wire Notes Line
	6800 1400 6800 4400
Wire Notes Line
	6800 4400 5600 4400
Wire Notes Line
	5600 4400 5600 1400
Text GLabel 6500 4600 3    59   Input ~ 0
PB15
Text GLabel 6400 4600 3    59   Input ~ 0
PB14
Text GLabel 6300 4600 3    59   Input ~ 0
PB13
Text GLabel 6200 4600 3    59   Input ~ 0
PB12
Text GLabel 6100 4600 3    59   Input ~ 0
PB11
Text GLabel 6000 4600 3    59   Input ~ 0
PB10
Text GLabel 7700 1400 2    50   Input ~ 0
GND1
Text GLabel 7700 4100 2    50   Input ~ 0
GND1
Text GLabel 7700 3500 2    50   Input ~ 0
PA9
Text GLabel 7700 3600 2    50   Input ~ 0
PA8
Text GLabel 7700 1700 2    50   BiDi ~ 0
PB9
$Comp
L Connector:Conn_01x28_Female J6
U 1 1 5C53528A
P 7500 2800
F 0 "J6" H 7394 1267 50  0001 C CNN
F 1 "Conn_01x28_Female" H 7527 2685 50  0001 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x28_P2.54mm_Vertical" H 7500 2800 50  0001 C CNN
F 3 "~" H 7500 2800 50  0001 C CNN
	1    7500 2800
	-1   0    0    1   
$EndComp
Text GLabel 7700 1600 2    50   Input ~ 0
5V
Text GLabel 7700 1800 2    50   BiDi ~ 0
PB8
Text GLabel 7700 1900 2    50   BiDi ~ 0
BOOT
Text GLabel 7700 2000 2    50   BiDi ~ 0
PB7
Text GLabel 7700 2100 2    50   BiDi ~ 0
PB6
Text GLabel 7700 2200 2    50   BiDi ~ 0
PB5
Text GLabel 7700 2300 2    50   BiDi ~ 0
PB4
Text GLabel 7700 2400 2    50   BiDi ~ 0
PB3
Text GLabel 7700 2500 2    50   BiDi ~ 0
PD2
Text GLabel 7700 2600 2    50   BiDi ~ 0
PC12
Text GLabel 7700 2700 2    50   BiDi ~ 0
PC11
Text GLabel 7700 2800 2    50   BiDi ~ 0
PC10
Text GLabel 7700 2900 2    50   BiDi ~ 0
PA15
Text GLabel 7700 3000 2    50   BiDi ~ 0
PA14
Text GLabel 7700 3100 2    50   BiDi ~ 0
PA13
Text GLabel 7700 3200 2    50   BiDi ~ 0
PA12
Text GLabel 7700 3300 2    50   BiDi ~ 0
PA11
Text GLabel 7700 3400 2    50   BiDi ~ 0
PA10
Text GLabel 7700 3700 2    50   BiDi ~ 0
PC9
Text GLabel 7700 3800 2    50   BiDi ~ 0
PC8
Text GLabel 7700 3900 2    50   BiDi ~ 0
PC7
Text GLabel 7700 4000 2    50   BiDi ~ 0
PC6
$EndSCHEMATC
