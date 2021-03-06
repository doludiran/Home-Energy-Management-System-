EESchema Schematic File Version 4
LIBS:PS Rev2-cache
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
Wire Wire Line
	5100 3000 5200 3000
Wire Wire Line
	5100 3200 5200 3200
Wire Wire Line
	6000 3000 6050 3000
Wire Wire Line
	6200 3200 6200 3100
Wire Wire Line
	6200 3100 6900 3100
Wire Wire Line
	6000 3200 6050 3200
Connection ~ 6200 3200
$Comp
L Device:C_Small C01
U 1 1 5C4BC2BF
P 6050 3100
F 0 "C01" H 6050 3400 50  0000 L CNN
F 1 "400 nF" H 6050 3300 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D6.0mm_W4.4mm_P5.00mm" H 6050 3100 50  0001 C CNN
F 3 "~" H 6050 3100 50  0001 C CNN
	1    6050 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	6050 3000 6900 3000
Connection ~ 6050 3200
Wire Wire Line
	6050 3200 6200 3200
$Comp
L 1935161:1935161 J03
U 1 1 5C4DEBC7
P 3400 4400
F 0 "J03" H 3350 4650 50  0000 L CNN
F 1 "1935161" H 3150 4150 50  0000 L CNN
F 2 "1935161:PHOENIX_1935161" H 3400 4400 50  0001 L BNN
F 3 "Phoenix Contact" H 3400 4400 50  0001 L BNN
F 4 "https://www.digikey.ca/product-detail/en/phoenix-contact/1935161/277-1667-ND/568614?utm_source=snapeda&utm_medium=aggregator&utm_campaign=symbol" H 3400 4400 50  0001 L BNN "Field4"
F 5 "None" H 3400 4400 50  0001 L BNN "Field5"
F 6 "Conn Terminal Blocks 2 POS 5mm Solder ST Thru-Hole 16A" H 3400 4400 50  0001 L BNN "Field6"
F 7 "1935161" H 3400 4400 50  0001 L BNN "Field7"
F 8 "277-1667-ND" H 3400 4400 50  0001 L BNN "Field8"
	1    3400 4400
	-1   0    0    1   
$EndComp
Text Notes 3300 4600 1    50   ~ 0
To Relay Coil
Text Notes 3400 4550 1    50   ~ 0
To L
$Comp
L 282836-3:282836-3 J02
U 1 1 5C4DF527
P 7100 3100
F 0 "J02" H 7050 2750 50  0000 L CNN
F 1 "282836-3" H 6950 2850 50  0000 L CNN
F 2 "282836-3:TE_282836-3" H 7100 3100 50  0001 L BNN
F 3 "A98077-ND" H 7100 3100 50  0001 L BNN
F 4 "https://www.te.com/usa-en/product-282836-3.html?te_bu=Cor&te_type=disp&te_campaign=seda_glo_cor-seda-global-disp-prtnr-fy19-seda-model-bom-cta_sma-317_1&elqCampaignId=32493" H 7100 3100 50  0001 L BNN "Field4"
F 5 "282836-3" H 7100 3100 50  0001 L BNN "Field5"
F 6 "None" H 7100 3100 50  0001 L BNN "Field6"
F 7 "282836-3" H 7100 3100 50  0001 L BNN "Field7"
F 8 "Compliant with Exemptions" H 7100 3100 50  0001 L BNN "Field8"
F 9 "https://www.digikey.ca/product-detail/en/te-connectivity-amp-connectors/282836-3/A98077-ND/1826940?utm_source=snapeda&utm_medium=aggregator&utm_campaign=symbol" H 7100 3100 50  0001 L BNN "Field9"
F 10 "TERMI-BLOK PCB MOUNT 90 3P." H 7100 3100 50  0001 L BNN "Field10"
F 11 "TE Connectivity" H 7100 3100 50  0001 L BNN "Field11"
	1    7100 3100
	1    0    0    -1  
$EndComp
Text Notes 6600 3000 0    50   ~ 0
+3.3V
Text Notes 6600 3100 0    50   ~ 0
GND
Connection ~ 6050 3000
Text Notes 7200 3100 0    50   ~ 0
To uC
$Comp
L Converter_ACDC:RAC04-xxSGA PS01
U 1 1 5C4A2129
P 5600 3100
F 0 "PS01" H 5600 3467 50  0000 C CNN
F 1 "RAC03-3.3SGA" H 5600 3376 50  0000 C CNN
F 2 "Converter_ACDC:Converter_ACDC_RECOM_RAC04-xxSGx_THT" H 5500 3400 50  0001 C CNN
F 3 "https://www.recom-power.com/pdf/Powerline-AC-DC/RAC04-GA.pdf" H 5500 3400 50  0001 C CNN
	1    5600 3100
	1    0    0    -1  
$EndComp
$Comp
L 1935161:1935161 J01
U 1 1 5C4E2FEB
P 3400 3000
F 0 "J01" H 3295 2633 50  0000 C CNN
F 1 "1935161" H 3295 2724 50  0000 C CNN
F 2 "1935161:PHOENIX_1935161" H 3400 3000 50  0001 L BNN
F 3 "Phoenix Contact" H 3400 3000 50  0001 L BNN
F 4 "https://www.digikey.ca/product-detail/en/phoenix-contact/1935161/277-1667-ND/568614?utm_source=snapeda&utm_medium=aggregator&utm_campaign=symbol" H 3400 3000 50  0001 L BNN "Field4"
F 5 "None" H 3400 3000 50  0001 L BNN "Field5"
F 6 "Conn Terminal Blocks 2 POS 5mm Solder ST Thru-Hole 16A" H 3400 3000 50  0001 L BNN "Field6"
F 7 "1935161" H 3400 3000 50  0001 L BNN "Field7"
F 8 "277-1667-ND" H 3400 3000 50  0001 L BNN "Field8"
	1    3400 3000
	-1   0    0    1   
$EndComp
Wire Wire Line
	3700 3100 3700 3300
Wire Wire Line
	5100 3300 5100 3200
$Comp
L TMOV20RP300E:TMOV20RP300E MOV01
U 1 1 5C4E3F91
P 4500 3000
F 0 "MOV01" V 4454 3100 50  0000 L CNN
F 1 "TMOV20RP300E" V 4545 3100 50  0000 L CNN
F 2 "TMOV20RP300E:CAPRR750W81L2100T1100H2300P" H 4500 3000 50  0001 L BNN
F 3 "Disc-20 Littelfuse" H 4500 3000 50  0001 L BNN
F 4 "TMOV20RP300E" H 4500 3000 50  0001 L BNN "Field4"
F 5 "None" H 4500 3000 50  0001 L BNN "Field5"
F 6 "Unavailable" H 4500 3000 50  0001 L BNN "Field6"
F 7 "Littelfuse Inc." H 4500 3000 50  0001 L BNN "Field7"
F 8 "TMOV® Series 517 VDC 300 V RMS 775 V Clamp 10000 A 800 pF Radial Lead Varistor" H 4500 3000 50  0001 L BNN "Field8"
	1    4500 3000
	0    1    1    0   
$EndComp
Wire Wire Line
	4500 3300 5100 3300
Wire Wire Line
	5100 2700 4500 2700
Wire Wire Line
	5100 2700 5100 3000
Wire Wire Line
	3700 2700 3700 2900
Wire Wire Line
	3700 2700 4500 2700
Connection ~ 4500 2700
Wire Wire Line
	3700 3300 4500 3300
Connection ~ 4500 3300
Wire Notes Line
	3200 5050 7900 5050
Wire Notes Line
	7900 2500 3200 2500
Text Notes 6600 3200 0    50   ~ 0
Control
$Comp
L Device:R R01
U 1 1 5C6F353E
P 6650 3700
F 0 "R01" V 6443 3700 50  0000 C CNN
F 1 "10k" V 6534 3700 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 6580 3700 50  0001 C CNN
F 3 "~" H 6650 3700 50  0001 C CNN
	1    6650 3700
	0    1    1    0   
$EndComp
Wire Wire Line
	6900 3200 6800 3200
Wire Wire Line
	6750 3700 6800 3700
Wire Wire Line
	6800 3700 6800 3200
$Comp
L Transistor_BJT:2N3904 Q01
U 1 1 5C6F2607
P 6300 3700
F 0 "Q01" H 6491 3654 50  0000 L CNN
F 1 "2N3904" H 6491 3745 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 6500 3625 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 6300 3700 50  0001 L CNN
	1    6300 3700
	-1   0    0    1   
$EndComp
Wire Wire Line
	6200 3200 6200 3500
$Comp
L EC2-3NU:EC2-3NU K01
U 1 1 5C6F4339
P 6500 4300
F 0 "K01" V 6454 4728 50  0000 L CNN
F 1 "EC2-3NU" V 6545 4728 50  0000 L CNN
F 2 "EC2-3NU:KEMET_EC2-3NU" H 6500 4300 50  0001 L BNN
F 3 "None" H 6500 4300 50  0001 L BNN
F 4 "EC2-3NU" H 6500 4300 50  0001 L BNN "Field4"
F 5 "Unavailable" H 6500 4300 50  0001 L BNN "Field5"
F 6 "KEMET" H 6500 4300 50  0001 L BNN "Field6"
F 7 "None" H 6500 4300 50  0001 L BNN "Field7"
F 8 "" H 6500 4300 50  0001 L BNN "Field8"
	1    6500 4300
	0    1    1    0   
$EndComp
Wire Wire Line
	6900 3000 6900 2800
Connection ~ 6900 3000
Wire Wire Line
	6800 3800 6800 3900
Wire Notes Line
	7900 2500 7900 5050
Wire Notes Line
	3200 2500 3200 5050
Wire Wire Line
	6600 4700 6600 4800
Wire Wire Line
	6600 4800 4950 4800
Wire Wire Line
	4950 4800 4950 4300
Wire Wire Line
	4950 4300 3700 4300
Wire Wire Line
	6800 4700 6800 4950
Wire Wire Line
	6800 4950 4750 4950
Wire Wire Line
	4750 4950 4750 4500
Wire Wire Line
	4750 4500 3700 4500
Wire Wire Line
	6900 2800 7450 2800
Wire Wire Line
	7450 2800 7450 3800
Wire Wire Line
	7450 3800 6800 3800
Connection ~ 6800 3700
$EndSCHEMATC
