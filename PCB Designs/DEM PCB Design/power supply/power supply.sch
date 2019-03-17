EESchema Schematic File Version 4
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Power Supply and Switching Circuit "
Date "2019-01-01"
Rev "0"
Comp "University of Regina "
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L RAC03-05SE_277:RAC03-05SE_277 PS1
U 1 1 5C27CDCC
P 3500 2800
F 0 "PS1" H 4250 3065 50  0000 C CNN
F 1 "RAC03-3.3SE_277" H 4250 2974 50  0000 C CNN
F 2 "RAC03-05SE" H 4850 2900 50  0001 L CNN
F 3 "https://www.recom-power.com/pdf/Powerline-AC-DC/RAC03-SE_277.pdf" H 4850 2800 50  0001 L CNN
F 4 "AC/DC Power Modules 3W 80-305Vin 5Vout 600mA" H 4850 2700 50  0001 L CNN "Description"
F 5 "" H 4850 2600 50  0001 L CNN "Height"
F 6 "RECOM Power" H 4850 2500 50  0001 L CNN "Manufacturer_Name"
F 7 "RAC03-05SE/277" H 4850 2400 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "1666700" H 4850 2300 50  0001 L CNN "RS Part Number"
F 9 "http://uk.rs-online.com/web/p/products/1666700" H 4850 2200 50  0001 L CNN "RS Price/Stock"
F 10 "919-RAC03-05SE/277" H 4850 2100 50  0001 L CNN "Mouser Part Number"
F 11 "https://www.mouser.com/Search/Refine.aspx?Keyword=919-RAC03-05SE%2F277" H 4850 2000 50  0001 L CNN "Mouser Price/Stock"
	1    3500 2800
	1    0    0    -1  
$EndComp
$Comp
L Device:Thermistor_NTC TH1
U 1 1 5C27D1D2
P 2150 4850
F 0 "TH1" V 1860 4850 50  0000 C CNN
F 1 "Thermistor_NTC" V 1951 4850 50  0000 C CNN
F 2 "" H 2150 4900 50  0001 C CNN
F 3 "~" H 2150 4900 50  0001 C CNN
	1    2150 4850
	0    1    1    0   
$EndComp
$Comp
L Device:Fuse F1
U 1 1 5C27D264
P 2750 4850
F 0 "F1" V 2553 4850 50  0000 C CNN
F 1 "0.600A" V 2644 4850 50  0000 C CNN
F 2 "0.900A" V 2680 4850 50  0001 C CNN
F 3 "~" H 2750 4850 50  0001 C CNN
	1    2750 4850
	0    1    1    0   
$EndComp
Wire Wire Line
	2300 4850 2600 4850
Wire Wire Line
	2900 4850 3250 4850
Wire Wire Line
	3250 5000 3250 4850
Connection ~ 3250 4850
$Comp
L Device:Varistor RV1
U 1 1 5C27D8B9
P 3250 5150
F 0 "RV1" H 3353 5196 50  0000 L CNN
F 1 "Varistor" H 3353 5105 50  0000 L CNN
F 2 "" V 3180 5150 50  0001 C CNN
F 3 "~" H 3250 5150 50  0001 C CNN
	1    3250 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3250 5300 3250 5400
Connection ~ 3250 5400
$Comp
L Triac_Thyristor:BT138-800 Q1
U 1 1 5C27E601
P 5650 2000
F 0 "Q1" H 5779 2046 50  0000 L CNN
F 1 "BT138-800" H 5779 1955 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 5850 1925 50  0001 L CIN
F 3 "http://www.nxp.com/documents/data_sheet/BT138_SER_D_E.pdf" H 5650 2000 50  0001 L CNN
	1    5650 2000
	1    0    0    -1  
$EndComp
$Comp
L Transformer:CST1_Split CT
U 1 1 5C2855F9
P 6600 2650
F 0 "CT" H 6600 2890 50  0001 C CNN
F 1 "1000:1" H 6600 2798 50  0000 C CNN
F 2 "Transformer_SMD:Transformer_Coilcraft_CST1" H 6600 2650 50  0001 C CNN
F 3 "https://www.coilcraft.com/pdfs/cst.pdf" H 6600 2650 50  0001 C CNN
	1    6600 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	6800 2650 7300 2650
Wire Wire Line
	7300 2650 7300 2700
Wire Wire Line
	6400 2650 6400 2800
Wire Wire Line
	6400 2800 7300 2800
Wire Wire Line
	4900 3900 5550 3900
Wire Wire Line
	7100 3000 7300 3000
Wire Wire Line
	6850 2900 7300 2900
$Comp
L power:GND #G01
U 1 1 5C286FD8
P 5900 3750
F 0 "#G01" H 5900 3500 50  0001 C CNN
F 1 "GND" H 5988 3713 50  0001 L CNN
F 2 "" H 5900 3750 50  0001 C CNN
F 3 "" H 5900 3750 50  0001 C CNN
	1    5900 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 2900 4900 3900
Wire Wire Line
	7100 3000 7100 3900
$Comp
L Connector:Conn_01x01_Female J2
U 1 1 5C28961C
P 5650 1050
F 0 "J2" V 5590 962 50  0000 R CNN
F 1 "120 VAC - L (from main supply)" V 5499 962 50  0000 R CNN
F 2 "" H 5650 1050 50  0001 C CNN
F 3 "~" H 5650 1050 50  0001 C CNN
	1    5650 1050
	0    -1   -1   0   
$EndComp
$Comp
L Connector:Conn_01x01_Female J3
U 1 1 5C289DB9
P 7500 2400
F 0 "J3" H 7527 2426 50  0000 L CNN
F 1 "120 VAC - L ( to load)" H 7527 2335 50  0000 L CNN
F 2 "" H 7500 2400 50  0001 C CNN
F 3 "~" H 7500 2400 50  0001 C CNN
	1    7500 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 2150 5650 2250
Wire Wire Line
	6850 3000 6850 2900
$Comp
L Device:R R2
U 1 1 5C28A789
P 6700 3000
F 0 "R2" V 6493 3000 50  0000 C CNN
F 1 "10k" V 6584 3000 50  0000 C CNN
F 2 "" V 6630 3000 50  0001 C CNN
F 3 "~" H 6700 3000 50  0001 C CNN
	1    6700 3000
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C1
U 1 1 5C2913E4
P 5100 3200
F 0 "C1" H 5009 3154 50  0000 R CNN
F 1 "0.1 uF" H 5009 3245 50  0000 R CNN
F 2 "" H 5100 3200 50  0001 C CNN
F 3 "~" H 5100 3200 50  0001 C CNN
	1    5100 3200
	1    0    0    1   
$EndComp
Wire Wire Line
	5900 3000 6200 3000
$Comp
L Device:R R1
U 1 1 5C297181
P 5400 3050
F 0 "R1" H 5330 3096 50  0000 R CNN
F 1 "2.2k" H 5330 3005 50  0000 R CNN
F 2 "" V 5330 3050 50  0001 C CNN
F 3 "~" H 5400 3050 50  0001 C CNN
	1    5400 3050
	-1   0    0    -1  
$EndComp
$Comp
L Isolator:6N138 U1
U 1 1 5C27E771
P 5900 3100
F 0 "U1" H 5900 3567 50  0000 C CNN
F 1 "6N138" H 5900 3476 50  0000 C CNN
F 2 "" H 6190 2800 50  0001 C CNN
F 3 "http://www.onsemi.com/pub/Collateral/HCPL2731-D.pdf" H 6190 2800 50  0001 C CNN
	1    5900 3100
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5000 2900 5100 2900
Wire Wire Line
	5100 3100 5100 2900
Connection ~ 5400 2900
Wire Wire Line
	5400 3200 5550 3200
Wire Wire Line
	5400 2900 5600 2900
Wire Wire Line
	6550 3000 6200 3000
Connection ~ 6200 3000
Wire Wire Line
	6300 3200 6200 3200
Connection ~ 5100 2900
Wire Wire Line
	5100 2900 5400 2900
Connection ~ 5100 3300
$Comp
L Device:C_Small C2
U 1 1 5C29D195
P 5550 3500
F 0 "C2" H 5642 3546 50  0000 L CNN
F 1 "15 pF" H 5642 3455 50  0000 L CNN
F 2 "" H 5550 3500 50  0001 C CNN
F 3 "~" H 5550 3500 50  0001 C CNN
	1    5550 3500
	1    0    0    -1  
$EndComp
Connection ~ 5550 3200
Wire Wire Line
	5550 3200 5600 3200
Wire Wire Line
	5250 2100 5500 2100
Wire Wire Line
	6300 3200 6300 3700
Wire Wire Line
	5100 3300 5100 3700
Wire Wire Line
	5100 3700 5200 3700
Wire Wire Line
	5550 3600 5550 3700
Connection ~ 5550 3700
Wire Wire Line
	5550 3700 5900 3700
Wire Wire Line
	5900 3700 5900 3750
Connection ~ 5900 3700
Wire Wire Line
	5900 3700 6150 3700
Wire Wire Line
	5550 3200 5550 3400
Wire Wire Line
	5100 3300 5600 3300
Wire Wire Line
	5400 3200 5250 3200
Wire Wire Line
	5250 3200 5250 2100
Connection ~ 5400 3200
Wire Wire Line
	5200 2800 5200 3700
Wire Wire Line
	5000 2800 5200 2800
Connection ~ 5200 3700
Wire Wire Line
	5200 3700 5550 3700
Connection ~ 6150 3700
Wire Wire Line
	6150 3700 6300 3700
Connection ~ 6150 3900
Wire Wire Line
	6150 3900 7100 3900
$Comp
L Device:C_Small C4
U 1 1 5C2A464E
P 6150 3800
F 0 "C4" H 6242 3846 50  0000 L CNN
F 1 "0.1 uF" H 6242 3755 50  0000 L CNN
F 2 "" H 6150 3800 50  0001 C CNN
F 3 "~" H 6150 3800 50  0001 C CNN
	1    6150 3800
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C3
U 1 1 5C2A469A
P 5550 3800
F 0 "C3" H 5642 3846 50  0000 L CNN
F 1 "47 uF" H 5642 3755 50  0000 L CNN
F 2 "" H 5550 3800 50  0001 C CNN
F 3 "~" H 5550 3800 50  0001 C CNN
	1    5550 3800
	1    0    0    -1  
$EndComp
Connection ~ 5550 3900
Wire Wire Line
	5550 3900 6150 3900
Wire Wire Line
	1750 5400 1750 5200
Wire Wire Line
	1750 5400 3250 5400
Wire Wire Line
	1750 4850 1750 5100
Wire Wire Line
	1750 4850 2000 4850
$Comp
L Device:Varistor RV2
U 1 1 5C2AA605
P 6400 1950
F 0 "RV2" H 6503 1996 50  0000 L CNN
F 1 "Varistor" H 6503 1905 50  0000 L CNN
F 2 "" V 6330 1950 50  0001 C CNN
F 3 "~" H 6400 1950 50  0001 C CNN
	1    6400 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 1800 5650 1800
Wire Wire Line
	5650 1800 5650 1850
Wire Wire Line
	6400 2100 6400 2250
Wire Wire Line
	6400 2250 5650 2250
$Comp
L Device:Fuse F2
U 1 1 5C2AD1FA
P 5650 1500
F 0 "F2" H 5590 1454 50  0000 R CNN
F 1 "40A" H 5590 1545 50  0000 R CNN
F 2 "0.900A" V 5580 1500 50  0001 C CNN
F 3 "~" H 5650 1500 50  0001 C CNN
	1    5650 1500
	-1   0    0    1   
$EndComp
Wire Wire Line
	5650 1250 5650 1350
Wire Wire Line
	5650 1650 5650 1800
Connection ~ 5650 1800
Wire Wire Line
	5650 2250 5650 2400
Wire Wire Line
	5650 2400 7300 2400
Connection ~ 5650 2250
$Comp
L Connector:Screw_Terminal_01x04 J4
U 1 1 5C2B2E07
P 7500 2800
F 0 "J4" H 7580 2792 50  0000 L CNN
F 1 "Screw_Terminal_01x04" H 7580 2701 50  0000 L CNN
F 2 "" H 7500 2800 50  0001 C CNN
F 3 "~" H 7500 2800 50  0001 C CNN
	1    7500 2800
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x01 J?
U 1 1 5C2B2ECB
P 4650 1150
F 0 "J?" V 4523 1230 50  0000 L CNN
F 1 "Screw_Terminal_01x01" V 4614 1230 50  0000 L CNN
F 2 "" H 4650 1150 50  0001 C CNN
F 3 "~" H 4650 1150 50  0001 C CNN
	1    4650 1150
	0    1    1    0   
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 J01
U 1 1 5C2B2FB2
P 1550 5200
F 0 "J01" H 1630 5192 50  0000 L CNN
F 1 "Screw Terminal" H 1630 5101 50  0000 L CNN
F 2 "" H 1550 5200 50  0001 C CNN
F 3 "~" H 1550 5200 50  0001 C CNN
	1    1550 5200
	-1   0    0    1   
$EndComp
$Comp
L Converter_ACDC:RAC04-xxSGA PS1
U 1 1 5C4A2129
P 4300 5150
F 0 "PS1" H 4300 5517 50  0000 C CNN
F 1 "RAC03-3.3SGA" H 4300 5426 50  0000 C CNN
F 2 "Converter_ACDC:Converter_ACDC_RECOM_RAC04-xxSGx_THT" H 4200 5450 50  0001 C CNN
F 3 "https://www.recom-power.com/pdf/Powerline-AC-DC/RAC04-GA.pdf" H 4200 5450 50  0001 C CNN
	1    4300 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3800 4850 3800 5050
Wire Wire Line
	3800 5050 3900 5050
Wire Wire Line
	3250 4850 3800 4850
Wire Wire Line
	3800 5400 3800 5250
Wire Wire Line
	3800 5250 3900 5250
Wire Wire Line
	3250 5400 3800 5400
$EndSCHEMATC