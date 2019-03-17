EESchema Schematic File Version 4
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
L LTC1966CMS8PBF:LTC1966CMS8PBF U1
U 1 1 5C6F3CA0
P 4850 3000
F 0 "U1" H 5750 3365 50  0000 C CNN
F 1 "LTC1966CMS8PBF" H 5750 3274 50  0000 C CNN
F 2 "LTC1966CMS8PBF:MSOP-8_MS" H 4850 3000 50  0001 L BNN
F 3 "https://www.digikey.ca/product-detail/en/linear-technology-analog-devices/LTC1966CMS8-PBF/LTC1966CMS8-PBF-ND/807753?utm_source=snapeda&utm_medium=aggregator&utm_campaign=symbol" H 4850 3000 50  0001 L BNN
F 4 "LTC1966CMS8#PBF" H 4850 3000 50  0001 L BNN "Field4"
F 5 "MSOP-8 Linear Technology" H 4850 3000 50  0001 L BNN "Field5"
F 6 "LTC1966 - Precision Micropower, Delta Sigma RMS-to-DC Converter" H 4850 3000 50  0001 L BNN "Field6"
F 7 "Linear Technology/Analog" H 4850 3000 50  0001 L BNN "Field7"
F 8 "LTC1966CMS8#PBF-ND" H 4850 3000 50  0001 L BNN "Field8"
	1    4850 3000
	1    0    0    -1  
$EndComp
$Comp
L LTC1966CMS8PBF:LTC1966CMS8PBF U2
U 1 1 5C6F3F20
P 5000 4300
F 0 "U2" H 5900 4665 50  0000 C CNN
F 1 "LTC1966CMS8PBF" H 5900 4574 50  0000 C CNN
F 2 "LTC1966CMS8PBF:MSOP-8_MS" H 5000 4300 50  0001 L BNN
F 3 "https://www.digikey.ca/product-detail/en/linear-technology-analog-devices/LTC1966CMS8-PBF/LTC1966CMS8-PBF-ND/807753?utm_source=snapeda&utm_medium=aggregator&utm_campaign=symbol" H 5000 4300 50  0001 L BNN
F 4 "LTC1966CMS8#PBF" H 5000 4300 50  0001 L BNN "Field4"
F 5 "MSOP-8 Linear Technology" H 5000 4300 50  0001 L BNN "Field5"
F 6 "LTC1966 - Precision Micropower, Delta Sigma RMS-to-DC Converter" H 5000 4300 50  0001 L BNN "Field6"
F 7 "Linear Technology/Analog" H 5000 4300 50  0001 L BNN "Field7"
F 8 "LTC1966CMS8#PBF-ND" H 5000 4300 50  0001 L BNN "Field8"
	1    5000 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 3000 4850 2450
Wire Wire Line
	4850 2450 5200 2450
Wire Wire Line
	7100 2450 7100 3000
Wire Wire Line
	7100 3000 6650 3000
$Comp
L Device:R R03
U 1 1 5C6F4435
P 4500 2950
F 0 "R03" H 4570 2996 50  0000 L CNN
F 1 "4" H 4570 2905 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0411_L9.9mm_D3.6mm_P12.70mm_Horizontal" V 4430 2950 50  0001 C CNN
F 3 "~" H 4500 2950 50  0001 C CNN
	1    4500 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	6650 3200 7450 3200
Wire Wire Line
	7450 3200 7450 2850
Wire Wire Line
	7450 2850 7750 2850
Wire Wire Line
	7750 3300 7750 3200
Wire Wire Line
	6650 3100 7300 3100
Wire Wire Line
	7750 2850 7750 2900
$Comp
L 282836-2:282836-2 J3
U 1 1 5C6F54C0
P 8050 2250
F 0 "J3" H 7970 2251 50  0000 R CNN
F 1 "282836-2" H 7970 2342 50  0000 R CNN
F 2 "282836-2:CONN_282836-2" H 8050 2250 50  0001 L BNN
F 3 "5 mm[.197 in]" H 8050 2250 50  0001 L BNN
F 4 "https://www.te.com/usa-en/product-282836-2.html?te_bu=Cor&te_type=disp&te_campaign=seda_glo_cor-seda-global-disp-prtnr-fy19-seda-model-bom-cta_sma-317_1&elqCampaignId=32493" H 8050 2250 50  0001 L BNN "Field4"
F 5 "Unavailable" H 8050 2250 50  0001 L BNN "Field5"
F 6 "None" H 8050 2250 50  0001 L BNN "Field6"
F 7 "Compliant with Exemptions" H 8050 2250 50  0001 L BNN "Field7"
F 8 "TE Connectivity" H 8050 2250 50  0001 L BNN "Field8"
F 9 "282836-2" H 8050 2250 50  0001 L BNN "Field9"
F 10 "GND" H 8050 2250 50  0001 L BNN "Field name"
F 11 "None" H 8050 2250 50  0001 L BNN "Field11"
F 12 "TERMI-BLOK PCB MOUNT 90 2P." H 8050 2250 50  0001 L BNN "Field12"
F 13 "282836-2" H 8050 2250 50  0001 L BNN "Field13"
	1    8050 2250
	-1   0    0    1   
$EndComp
$Comp
L 282836-2:282836-2 J1
U 1 1 5C6F5687
P 4050 3000
F 0 "J1" H 4180 3367 50  0000 C CNN
F 1 "282836-2" H 4180 3276 50  0000 C CNN
F 2 "282836-2:CONN_282836-2" H 4050 3000 50  0001 L BNN
F 3 "5 mm[.197 in]" H 4050 3000 50  0001 L BNN
F 4 "https://www.te.com/usa-en/product-282836-2.html?te_bu=Cor&te_type=disp&te_campaign=seda_glo_cor-seda-global-disp-prtnr-fy19-seda-model-bom-cta_sma-317_1&elqCampaignId=32493" H 4050 3000 50  0001 L BNN "Field4"
F 5 "Unavailable" H 4050 3000 50  0001 L BNN "Field5"
F 6 "None" H 4050 3000 50  0001 L BNN "Field6"
F 7 "Compliant with Exemptions" H 4050 3000 50  0001 L BNN "Field7"
F 8 "TE Connectivity" H 4050 3000 50  0001 L BNN "Field8"
F 9 "282836-2" H 4050 3000 50  0001 L BNN "Field9"
F 10 "2" H 4050 3000 50  0001 L BNN "Field10"
F 11 "None" H 4050 3000 50  0001 L BNN "Field11"
F 12 "TERMI-BLOK PCB MOUNT 90 2P." H 4050 3000 50  0001 L BNN "Field12"
F 13 "282836-2" H 4050 3000 50  0001 L BNN "Field13"
	1    4050 3000
	1    0    0    -1  
$EndComp
$Comp
L 282836-2:282836-2 J2
U 1 1 5C6F5750
P 3950 4600
F 0 "J2" H 4080 4967 50  0000 C CNN
F 1 "282836-2" H 4080 4876 50  0000 C CNN
F 2 "282836-2:CONN_282836-2" H 3950 4600 50  0001 L BNN
F 3 "5 mm[.197 in]" H 3950 4600 50  0001 L BNN
F 4 "https://www.te.com/usa-en/product-282836-2.html?te_bu=Cor&te_type=disp&te_campaign=seda_glo_cor-seda-global-disp-prtnr-fy19-seda-model-bom-cta_sma-317_1&elqCampaignId=32493" H 3950 4600 50  0001 L BNN "Field4"
F 5 "Unavailable" H 3950 4600 50  0001 L BNN "Field5"
F 6 "None" H 3950 4600 50  0001 L BNN "Field6"
F 7 "Compliant with Exemptions" H 3950 4600 50  0001 L BNN "Field7"
F 8 "TE Connectivity" H 3950 4600 50  0001 L BNN "Field8"
F 9 "282836-2" H 3950 4600 50  0001 L BNN "Field9"
F 10 "2" H 3950 4600 50  0001 L BNN "Field10"
F 11 "None" H 3950 4600 50  0001 L BNN "Field11"
F 12 "TERMI-BLOK PCB MOUNT 90 2P." H 3950 4600 50  0001 L BNN "Field12"
F 13 "282836-2" H 3950 4600 50  0001 L BNN "Field13"
	1    3950 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 2900 4400 2900
Wire Wire Line
	4400 2900 4400 2750
Wire Wire Line
	4350 3000 4400 3000
Wire Wire Line
	4400 3000 4400 3200
Wire Wire Line
	4850 3300 4750 3300
Wire Wire Line
	4750 2450 4850 2450
Connection ~ 4850 2450
Wire Wire Line
	4750 2450 4750 3300
Wire Wire Line
	4850 3100 4700 3100
Wire Wire Line
	4700 3100 4700 2750
$Comp
L Device:C C02
U 1 1 5C6FA5FA
P 7750 3050
F 0 "C02" H 7865 3096 50  0000 L CNN
F 1 "1uF" H 7865 3005 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L19.0mm_W5.0mm_P15.00mm_MKS4" H 7788 2900 50  0001 C CNN
F 3 "~" H 7750 3050 50  0001 C CNN
	1    7750 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6650 3300 7750 3300
Wire Wire Line
	6950 2000 7300 2000
$Comp
L Device:R R01
U 1 1 5C6FBBDA
P 6800 2000
F 0 "R01" V 6593 2000 50  0000 C CNN
F 1 "100k" V 6684 2000 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0411_L9.9mm_D3.6mm_P12.70mm_Horizontal" V 6730 2000 50  0001 C CNN
F 3 "~" H 6800 2000 50  0001 C CNN
	1    6800 2000
	0    1    1    0   
$EndComp
Wire Wire Line
	6650 2000 6600 2000
$Comp
L Device:R R02
U 1 1 5C6FCCC7
P 6300 2000
F 0 "R02" V 6093 2000 50  0000 C CNN
F 1 "100k" V 6184 2000 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0411_L9.9mm_D3.6mm_P12.70mm_Horizontal" V 6230 2000 50  0001 C CNN
F 3 "~" H 6300 2000 50  0001 C CNN
	1    6300 2000
	0    1    1    0   
$EndComp
Wire Wire Line
	6150 2000 5850 2000
Wire Wire Line
	5850 2000 5850 2450
Connection ~ 5850 2450
Wire Wire Line
	5850 2450 6900 2450
Wire Wire Line
	6600 2000 6600 1650
Wire Wire Line
	6600 1650 5200 1650
Wire Wire Line
	5200 1650 5200 1850
Connection ~ 6600 2000
Wire Wire Line
	6600 2000 6450 2000
$Comp
L Device:C C01
U 1 1 5C6FE588
P 5200 2000
F 0 "C01" H 5315 2046 50  0000 L CNN
F 1 "0.1uF" H 5315 1955 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L19.0mm_W5.0mm_P15.00mm_MKS4" H 5238 1850 50  0001 C CNN
F 3 "~" H 5200 2000 50  0001 C CNN
	1    5200 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 2150 5200 2450
Connection ~ 5200 2450
Wire Wire Line
	5200 2450 5850 2450
Connection ~ 5200 1850
Wire Wire Line
	4400 3200 4500 3200
Wire Wire Line
	4400 2750 4500 2750
Wire Wire Line
	4500 2800 4500 2750
Connection ~ 4500 2750
Wire Wire Line
	4500 2750 4700 2750
Wire Wire Line
	4500 3100 4500 3200
Connection ~ 4500 3200
Wire Wire Line
	4500 3200 4650 3200
Wire Wire Line
	4650 3200 4650 1850
Wire Wire Line
	4650 1850 5200 1850
Connection ~ 4650 3200
Wire Wire Line
	4650 3200 4850 3200
Wire Wire Line
	4850 4300 4850 4150
Wire Wire Line
	7050 3850 7050 4300
Wire Wire Line
	7050 4300 6800 4300
$Comp
L Device:R R04
U 1 1 5C70B7CD
P 4550 4400
F 0 "R04" H 4620 4446 50  0000 L CNN
F 1 "10k" H 4620 4355 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0411_L9.9mm_D3.6mm_P12.70mm_Horizontal" V 4480 4400 50  0001 C CNN
F 3 "~" H 4550 4400 50  0001 C CNN
	1    4550 4400
	1    0    0    -1  
$EndComp
$Comp
L Device:R R05
U 1 1 5C70B85D
P 4550 4900
F 0 "R05" H 4620 4946 50  0000 L CNN
F 1 "215k" H 4620 4855 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0411_L9.9mm_D3.6mm_P12.70mm_Horizontal" V 4480 4900 50  0001 C CNN
F 3 "~" H 4550 4900 50  0001 C CNN
	1    4550 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 4500 4350 4500
Wire Wire Line
	4350 4500 4350 4200
Wire Wire Line
	4350 4200 4550 4200
Wire Wire Line
	4550 4200 4550 4250
Wire Wire Line
	4550 4550 4550 4650
Wire Wire Line
	4550 4650 4850 4650
Wire Wire Line
	4850 4650 4850 4400
Connection ~ 4550 4650
Wire Wire Line
	4550 4650 4550 4750
Wire Wire Line
	4900 4500 4900 4950
Wire Wire Line
	4650 4150 4850 4150
Connection ~ 4850 4150
Wire Wire Line
	4850 4150 4850 3850
$Comp
L Device:C C03
U 1 1 5C713C26
P 4900 5100
F 0 "C03" H 5015 5146 50  0000 L CNN
F 1 "0.1uF" H 5015 5055 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L19.0mm_W5.0mm_P15.00mm_MKS4" H 4938 4950 50  0001 C CNN
F 3 "~" H 4900 5100 50  0001 C CNN
	1    4900 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 5250 4900 5250
Wire Wire Line
	4850 4400 5000 4400
Wire Wire Line
	5000 4500 4900 4500
Wire Wire Line
	4850 4300 5000 4300
Wire Wire Line
	7250 4400 6800 4400
Wire Wire Line
	6800 4500 7800 4500
Wire Wire Line
	6800 4600 6800 4800
$Comp
L Device:C C04
U 1 1 5C72D03D
P 7800 4650
F 0 "C04" H 7915 4696 50  0000 L CNN
F 1 "1uF" H 7915 4605 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L19.0mm_W5.0mm_P15.00mm_MKS4" H 7838 4500 50  0001 C CNN
F 3 "~" H 7800 4650 50  0001 C CNN
	1    7800 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	7250 4000 7250 4400
$Comp
L 282836-2:282836-2 J4
U 1 1 5C6F55A4
P 9100 3200
F 0 "J4" H 9020 3201 50  0000 R CNN
F 1 "282836-2" H 9020 3292 50  0000 R CNN
F 2 "282836-2:CONN_282836-2" H 9100 3200 50  0001 L BNN
F 3 "5 mm[.197 in]" H 9100 3200 50  0001 L BNN
F 4 "https://www.te.com/usa-en/product-282836-2.html?te_bu=Cor&te_type=disp&te_campaign=seda_glo_cor-seda-global-disp-prtnr-fy19-seda-model-bom-cta_sma-317_1&elqCampaignId=32493" H 9100 3200 50  0001 L BNN "Field4"
F 5 "Unavailable" H 9100 3200 50  0001 L BNN "Field5"
F 6 "None" H 9100 3200 50  0001 L BNN "Field6"
F 7 "Compliant with Exemptions" H 9100 3200 50  0001 L BNN "Field7"
F 8 "TE Connectivity" H 9100 3200 50  0001 L BNN "Field8"
F 9 "282836-2" H 9100 3200 50  0001 L BNN "Field9"
F 10 "2" H 9100 3200 50  0001 L BNN "Field10"
F 11 "None" H 9100 3200 50  0001 L BNN "Field11"
F 12 "TERMI-BLOK PCB MOUNT 90 2P." H 9100 3200 50  0001 L BNN "Field12"
F 13 "282836-2" H 9100 3200 50  0001 L BNN "Field13"
	1    9100 3200
	-1   0    0    1   
$EndComp
Wire Wire Line
	6800 4800 7800 4800
Wire Wire Line
	8200 4000 7250 4000
Wire Wire Line
	4850 3850 6800 3850
Wire Wire Line
	6800 3850 6800 3700
Wire Wire Line
	6800 3700 7800 3700
Connection ~ 6800 3850
Wire Wire Line
	6800 3850 7050 3850
Wire Wire Line
	7800 3700 7800 4350
Connection ~ 7800 4500
Wire Wire Line
	7300 2550 8200 2550
Wire Wire Line
	8200 2550 8200 4000
Connection ~ 7300 2550
Wire Wire Line
	7300 2550 7300 3100
Wire Wire Line
	6900 2450 6900 2200
Wire Wire Line
	6900 2200 7500 2200
Wire Wire Line
	7750 2200 7750 2250
Connection ~ 6900 2450
Wire Wire Line
	6900 2450 7100 2450
Wire Wire Line
	7800 4350 8500 4350
Wire Wire Line
	8500 4350 8500 2050
Wire Wire Line
	8500 2050 7700 2050
Wire Wire Line
	7700 2050 7700 2200
Connection ~ 7800 4350
Wire Wire Line
	7800 4350 7800 4500
Connection ~ 7700 2200
Wire Wire Line
	7700 2200 7750 2200
Wire Wire Line
	7800 4800 8650 4800
Wire Wire Line
	8650 4800 8650 3300
Wire Wire Line
	8650 3300 8800 3300
Connection ~ 7800 4800
Wire Wire Line
	7750 2850 7750 2700
Wire Wire Line
	7750 2700 7500 2700
Wire Wire Line
	7500 2700 7500 2200
Connection ~ 7750 2850
Connection ~ 7500 2200
Wire Wire Line
	7500 2200 7700 2200
$Comp
L Device:R R06
U 1 1 5C7A0E0A
P 4550 5200
F 0 "R06" H 4350 5300 50  0000 L CNN
F 1 "1k" H 4400 5200 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0411_L9.9mm_D3.6mm_P12.70mm_Horizontal" V 4480 5200 50  0001 C CNN
F 3 "~" H 4550 5200 50  0001 C CNN
	1    4550 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 4150 4650 5250
Wire Wire Line
	4250 5450 4550 5450
Wire Wire Line
	4550 5450 4550 5350
Wire Wire Line
	4250 4600 4250 5450
Wire Wire Line
	5000 5400 4650 5400
Wire Wire Line
	4650 5400 4650 5250
Wire Wire Line
	5000 4600 5000 5400
Connection ~ 4650 5250
Wire Wire Line
	4650 5400 4650 5450
Wire Wire Line
	4650 5450 4550 5450
Connection ~ 4650 5400
Connection ~ 4550 5450
Wire Wire Line
	8050 3300 8050 3200
Wire Wire Line
	8050 3200 8800 3200
Wire Wire Line
	7750 3300 8050 3300
Connection ~ 7750 3300
Wire Wire Line
	7300 2000 7300 2350
Wire Wire Line
	7750 2350 7300 2350
Connection ~ 7300 2350
Wire Wire Line
	7300 2350 7300 2550
$EndSCHEMATC
