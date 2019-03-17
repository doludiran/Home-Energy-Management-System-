EESchema Schematic File Version 4
LIBS:ccu_pcb-cache
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
L Connector_Generic:Conn_02x20_Odd_Even J1
U 1 1 5C4EF2A8
P 4050 3450
F 0 "J1" H 4100 4567 50  0000 C CNN
F 1 "Conn_02x20_Odd_Even" H 4100 4476 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x20_P2.54mm_Vertical" H 4050 3450 50  0001 C CNN
F 3 "~" H 4050 3450 50  0001 C CNN
	1    4050 3450
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x05_Male J3
U 1 1 5C4EF7D1
P 7200 3700
F 0 "J3" H 7306 4078 50  0000 C CNN
F 1 "Conn_01x05_Male" H 7306 3987 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x05_P2.54mm_Vertical" H 7200 3700 50  0001 C CNN
F 3 "~" H 7200 3700 50  0001 C CNN
	1    7200 3700
	1    0    0    -1  
$EndComp
Text GLabel 3850 3350 0    50   Input ~ 0
VCC
Text GLabel 4350 2750 2    50   Input ~ 0
GND
Text GLabel 4350 2950 2    50   Input ~ 0
X_DOUT
Text GLabel 4350 2850 2    50   Input ~ 0
X_DIN
Text GLabel 7400 3600 2    50   Input ~ 0
GND2
Text GLabel 7400 2750 2    50   Input ~ 0
GND3
Text GLabel 7400 2650 2    50   Input ~ 0
5Vsupply
Text GLabel 7400 3900 2    50   Input ~ 0
Therm_out
Text GLabel 7400 3500 2    50   Input ~ 0
Therm_in_h
Text GLabel 7400 3700 2    50   Input ~ 0
Therm_in_c
Text GLabel 4350 4450 2    50   Input ~ 0
Therm_out
Text GLabel 4350 4050 2    50   Input ~ 0
Therm_in_h
Text GLabel 4350 4250 2    50   Input ~ 0
Therm_in_c
NoConn ~ 4350 3150
NoConn ~ 4350 3550
NoConn ~ 4350 3650
NoConn ~ 4350 3750
NoConn ~ 4350 3850
NoConn ~ 3850 4350
NoConn ~ 3850 4250
NoConn ~ 3850 4150
NoConn ~ 3850 4050
NoConn ~ 3850 3950
NoConn ~ 3850 3850
NoConn ~ 3850 3750
NoConn ~ 3850 3650
NoConn ~ 3850 3550
NoConn ~ 3850 3450
NoConn ~ 3850 3250
NoConn ~ 3850 3150
NoConn ~ 3850 3050
NoConn ~ 3850 2950
NoConn ~ 3850 2850
NoConn ~ 3850 2750
NoConn ~ 3850 2650
Text GLabel 5300 2900 0    50   Input ~ 0
X_DIN
Text GLabel 5300 2800 0    50   Input ~ 0
X_DOUT
Text GLabel 5300 2700 0    50   Input ~ 0
VCC
Text GLabel 5300 3600 0    50   Input ~ 0
GND
$Comp
L Connector:Conn_01x02_Male J2
U 1 1 5C50A7E1
P 7200 2650
F 0 "J2" H 7306 2828 50  0000 C CNN
F 1 "Conn_01x02_Male" H 7306 2737 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 7200 2650 50  0001 C CNN
F 3 "~" H 7200 2650 50  0001 C CNN
	1    7200 2650
	1    0    0    -1  
$EndComp
$Comp
L XB24CDMPIT-001:XB24CDMPIT-001 U1
U 1 1 5C50AEE8
P 5900 3100
F 0 "U1" H 5900 3100 50  0001 L BNN
F 1 "XB24CDMPIT-001" H 5900 3100 50  0001 L BNN
F 2 "XB24CDMPIT-001:DIP-20" H 5900 3100 50  0001 L BNN
F 3 "XBee S2C DigiMesh, 2.4GHz, TH _PCB Ant_" H 5900 3100 50  0001 L BNN
F 4 "XB24CDMPIT-001" H 5900 3100 50  0001 L BNN "Field4"
F 5 "None" H 5900 3100 50  0001 L BNN "Field5"
F 6 "Unavailable" H 5900 3100 50  0001 L BNN "Field6"
F 7 "Digi International" H 5900 3100 50  0001 L BNN "Field7"
F 8 "Module Digi International" H 5900 3100 50  0001 L BNN "Field8"
	1    5900 3100
	1    0    0    -1  
$EndComp
NoConn ~ 6500 2700
NoConn ~ 6500 2800
NoConn ~ 6500 2900
NoConn ~ 6500 3000
NoConn ~ 6500 3100
NoConn ~ 6500 3200
NoConn ~ 6500 3300
NoConn ~ 6500 3400
NoConn ~ 6500 3500
NoConn ~ 6500 3600
NoConn ~ 5300 3000
NoConn ~ 5300 3100
NoConn ~ 5300 3200
NoConn ~ 5300 3300
NoConn ~ 5300 3400
NoConn ~ 5300 3500
NoConn ~ 4350 2650
Text GLabel 7400 3800 2    50   Input ~ 0
5Vsupply
Text GLabel 4350 2550 2    50   Input ~ 0
5Vsupply
NoConn ~ -50  50  
NoConn ~ -150 150 
NoConn ~ 4350 3250
NoConn ~ 4350 3050
NoConn ~ 3850 4450
NoConn ~ 4350 4350
NoConn ~ 4350 3450
Text GLabel 4350 4150 2    50   Input ~ 0
GND2
Text GLabel 4350 3950 2    50   Input ~ 0
GND3
NoConn ~ 4350 3350
NoConn ~ 3850 2550
$EndSCHEMATC
