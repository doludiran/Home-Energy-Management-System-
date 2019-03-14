EESchema Schematic File Version 4
LIBS:Revised PS-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Power Supply and Switching Circuit"
Date "2019-01-25"
Rev "2"
Comp "University of Regina "
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	6500 3200 6600 3200
Wire Wire Line
	6500 3400 6600 3400
Wire Wire Line
	7400 3200 7450 3200
Wire Wire Line
	7600 3400 7600 3300
Wire Wire Line
	7600 3300 8300 3300
Wire Wire Line
	7400 3400 7450 3400
Connection ~ 7600 3400
$Comp
L Device:C_Small C1
U 1 1 5C4BC2BF
P 7450 3300
F 0 "C1" H 7450 3600 50  0000 L CNN
F 1 "400 nF" H 7450 3500 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D6.0mm_W4.4mm_P5.00mm" H 7450 3300 50  0001 C CNN
F 3 "~" H 7450 3300 50  0001 C CNN
	1    7450 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	7450 3200 8300 3200
Connection ~ 7450 3400
Wire Wire Line
	7450 3400 7600 3400
$Comp
L 1935161:1935161 J4
U 1 1 5C4DEBC7
P 7700 4700
F 0 "J4" V 7700 5000 50  0000 L CNN
F 1 "1935161" V 7800 5000 50  0000 L CNN
F 2 "1935161:PHOENIX_1935161" H 7700 4700 50  0001 L BNN
F 3 "Phoenix Contact" H 7700 4700 50  0001 L BNN
F 4 "https://www.digikey.ca/product-detail/en/phoenix-contact/1935161/277-1667-ND/568614?utm_source=snapeda&utm_medium=aggregator&utm_campaign=symbol" H 7700 4700 50  0001 L BNN "Field4"
F 5 "None" H 7700 4700 50  0001 L BNN "Field5"
F 6 "Conn Terminal Blocks 2 POS 5mm Solder ST Thru-Hole 16A" H 7700 4700 50  0001 L BNN "Field6"
F 7 "1935161" H 7700 4700 50  0001 L BNN "Field7"
F 8 "277-1667-ND" H 7700 4700 50  0001 L BNN "Field8"
	1    7700 4700
	0    1    1    0   
$EndComp
Text Notes 7800 4600 0    50   ~ 0
To Relay Coil
Text Notes 7400 4600 0    50   ~ 0
To L
$Comp
L 282836-3:282836-3 J3
U 1 1 5C4DF527
P 8500 3300
F 0 "J3" H 8700 3200 50  0000 L CNN
F 1 "282836-3" H 8700 3100 50  0000 L CNN
F 2 "282836-3:TE_282836-3" H 8500 3300 50  0001 L BNN
F 3 "A98077-ND" H 8500 3300 50  0001 L BNN
F 4 "https://www.te.com/usa-en/product-282836-3.html?te_bu=Cor&te_type=disp&te_campaign=seda_glo_cor-seda-global-disp-prtnr-fy19-seda-model-bom-cta_sma-317_1&elqCampaignId=32493" H 8500 3300 50  0001 L BNN "Field4"
F 5 "282836-3" H 8500 3300 50  0001 L BNN "Field5"
F 6 "None" H 8500 3300 50  0001 L BNN "Field6"
F 7 "282836-3" H 8500 3300 50  0001 L BNN "Field7"
F 8 "Compliant with Exemptions" H 8500 3300 50  0001 L BNN "Field8"
F 9 "https://www.digikey.ca/product-detail/en/te-connectivity-amp-connectors/282836-3/A98077-ND/1826940?utm_source=snapeda&utm_medium=aggregator&utm_campaign=symbol" H 8500 3300 50  0001 L BNN "Field9"
F 10 "TERMI-BLOK PCB MOUNT 90 3P." H 8500 3300 50  0001 L BNN "Field10"
F 11 "TE Connectivity" H 8500 3300 50  0001 L BNN "Field11"
	1    8500 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	7800 4200 7800 4400
Wire Wire Line
	7600 4200 7600 4400
Wire Wire Line
	7800 3400 8300 3400
Wire Wire Line
	7800 3400 7800 3600
Wire Wire Line
	7600 3600 7600 3400
$Comp
L Relay_SolidState:MOC3023M U1
U 1 1 5C4A661B
P 7700 3900
F 0 "U1" V 7654 4088 50  0000 L CNN
F 1 "MOC3023M" V 7750 4100 50  0000 L CNN
F 2 "MOC3023:DIP762W48P254L889H508Q6" H 7500 3700 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/MO/MOC3020M.pdf" H 7675 3900 50  0001 L CNN
	1    7700 3900
	0    1    1    0   
$EndComp
Text Notes 8000 3200 0    50   ~ 0
+3.3V
Text Notes 8000 3300 0    50   ~ 0
GND
Text Notes 8000 3400 0    50   ~ 0
Control
Connection ~ 7450 3200
Text Notes 8600 3300 0    50   ~ 0
To uC
$Comp
L Converter_ACDC:RAC04-xxSGA PS1
U 1 1 5C4A2129
P 7000 3300
F 0 "PS1" H 7000 3667 50  0000 C CNN
F 1 "RAC03-3.3SGA" H 7000 3576 50  0000 C CNN
F 2 "Converter_ACDC:Converter_ACDC_RECOM_RAC04-xxSGx_THT" H 6900 3600 50  0001 C CNN
F 3 "https://www.recom-power.com/pdf/Powerline-AC-DC/RAC04-GA.pdf" H 6900 3600 50  0001 C CNN
	1    7000 3300
	1    0    0    -1  
$EndComp
$Comp
L 1935161:1935161 J1
U 1 1 5C4E2FEB
P 4800 3200
F 0 "J1" H 4695 2833 50  0000 C CNN
F 1 "1935161" H 4695 2924 50  0000 C CNN
F 2 "1935161:PHOENIX_1935161" H 4800 3200 50  0001 L BNN
F 3 "Phoenix Contact" H 4800 3200 50  0001 L BNN
F 4 "https://www.digikey.ca/product-detail/en/phoenix-contact/1935161/277-1667-ND/568614?utm_source=snapeda&utm_medium=aggregator&utm_campaign=symbol" H 4800 3200 50  0001 L BNN "Field4"
F 5 "None" H 4800 3200 50  0001 L BNN "Field5"
F 6 "Conn Terminal Blocks 2 POS 5mm Solder ST Thru-Hole 16A" H 4800 3200 50  0001 L BNN "Field6"
F 7 "1935161" H 4800 3200 50  0001 L BNN "Field7"
F 8 "277-1667-ND" H 4800 3200 50  0001 L BNN "Field8"
	1    4800 3200
	-1   0    0    1   
$EndComp
Wire Wire Line
	5100 3300 5100 3500
Wire Wire Line
	6500 3500 6500 3400
$Comp
L TMOV20RP300E:TMOV20RP300E MOV1
U 1 1 5C4E3F91
P 5900 3200
F 0 "MOV1" V 5854 3300 50  0000 L CNN
F 1 "TMOV20RP300E" V 5945 3300 50  0000 L CNN
F 2 "TMOV20RP300E:CAPRR750W81L2100T1100H2300P" H 5900 3200 50  0001 L BNN
F 3 "Disc-20 Littelfuse" H 5900 3200 50  0001 L BNN
F 4 "TMOV20RP300E" H 5900 3200 50  0001 L BNN "Field4"
F 5 "None" H 5900 3200 50  0001 L BNN "Field5"
F 6 "Unavailable" H 5900 3200 50  0001 L BNN "Field6"
F 7 "Littelfuse Inc." H 5900 3200 50  0001 L BNN "Field7"
F 8 "TMOV® Series 517 VDC 300 V RMS 775 V Clamp 10000 A 800 pF Radial Lead Varistor" H 5900 3200 50  0001 L BNN "Field8"
	1    5900 3200
	0    1    1    0   
$EndComp
Wire Wire Line
	5900 3500 6500 3500
Wire Wire Line
	6500 2900 5900 2900
Wire Wire Line
	6500 2900 6500 3200
Wire Wire Line
	5100 2900 5100 3100
Wire Wire Line
	5100 2900 5900 2900
Connection ~ 5900 2900
Wire Wire Line
	5100 3500 5900 3500
Connection ~ 5900 3500
Wire Notes Line
	4600 4900 9300 4900
Wire Notes Line
	9300 4900 9300 2700
Wire Notes Line
	9300 2700 4600 2700
Wire Notes Line
	4600 2700 4600 4900
$EndSCHEMATC
