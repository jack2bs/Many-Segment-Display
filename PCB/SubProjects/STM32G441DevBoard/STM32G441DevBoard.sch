EESchema Schematic File Version 4
EELAYER 30 0
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
L MCU_ST_STM32G4:STM32G441CBT6 U1
U 1 1 61D3E474
P 1800 1000
F 0 "U1" H 3200 1387 60  0000 C CNN
F 1 "STM32G441CBT6" H 3200 1281 60  0000 C CNN
F 2 "MCU_ST_STM32G4:STM32G441CBT6" H 3200 1240 60  0001 C CNN
F 3 "" H 1800 1000 60  0000 C CNN
	1    1800 1000
	1    0    0    -1  
$EndComp
$Comp
L MCU_ST_STM32G4:STM32G441CBT6 U1
U 2 1 61D3F3B1
P 650 5000
F 0 "U1" H 1450 5387 60  0000 C CNN
F 1 "STM32G441CBT6" H 1450 5281 60  0000 C CNN
F 2 "MCU_ST_STM32G4:STM32G441CBT6" H 2050 5240 60  0001 C CNN
F 3 "" H 650 5000 60  0000 C CNN
	2    650  5000
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C26
U 1 1 61D49360
P 9950 1600
F 0 "C26" H 10042 1646 50  0000 L CNN
F 1 "0.1uF" H 10042 1555 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 9950 1600 50  0001 C CNN
F 3 "~" H 9950 1600 50  0001 C CNN
	1    9950 1600
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW1
U 1 1 61D496F5
P 10600 1700
F 0 "SW1" H 10600 1985 50  0000 C CNN
F 1 "SW_Push" H 10600 1894 50  0000 C CNN
F 2 "Button_Switch_SMD:SW_Push_KMR421GULCLFS" H 10600 1900 50  0001 C CNN
F 3 "~" H 10600 1900 50  0001 C CNN
	1    10600 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	9850 1500 9950 1500
Wire Wire Line
	9950 1500 10400 1500
Wire Wire Line
	10400 1500 10400 1700
Connection ~ 9950 1500
Wire Wire Line
	9950 1700 9950 1800
Wire Wire Line
	9950 1800 10800 1800
Wire Wire Line
	10800 1800 10800 1700
$Comp
L power:GND #PWR0101
U 1 1 61D4C411
P 10800 1800
F 0 "#PWR0101" H 10800 1550 50  0001 C CNN
F 1 "GND" H 10805 1627 50  0000 C CNN
F 2 "" H 10800 1800 50  0001 C CNN
F 3 "" H 10800 1800 50  0001 C CNN
	1    10800 1800
	1    0    0    -1  
$EndComp
Connection ~ 10800 1800
$Comp
L Device:Crystal_Small Y2
U 1 1 61D4D0E5
P 10000 950
F 0 "Y2" V 9954 1038 50  0000 L CNN
F 1 "Crystal_Small" V 10045 1038 50  0000 L CNN
F 2 "Crystal:Crystal_SMD_3215-2Pin_3.2x1.5mm" H 10000 950 50  0001 C CNN
F 3 "~" H 10000 950 50  0001 C CNN
	1    10000 950 
	0    1    1    0   
$EndComp
Wire Wire Line
	9850 850  10000 850 
Wire Wire Line
	9850 1050 10000 1050
$Comp
L Device:C_Small C20
U 1 1 61D4DF43
P 10300 850
F 0 "C20" V 10071 850 50  0000 C CNN
F 1 "15pF" V 10162 850 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 10300 850 50  0001 C CNN
F 3 "~" H 10300 850 50  0001 C CNN
	1    10300 850 
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C21
U 1 1 61D4E86C
P 10700 1050
F 0 "C21" V 10471 1050 50  0000 C CNN
F 1 "15pF" V 10562 1050 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 10700 1050 50  0001 C CNN
F 3 "~" H 10700 1050 50  0001 C CNN
	1    10700 1050
	0    1    1    0   
$EndComp
Wire Wire Line
	10000 1050 10600 1050
Connection ~ 10000 1050
Wire Wire Line
	10000 850  10200 850 
Connection ~ 10000 850 
Wire Wire Line
	10400 850  10800 850 
Wire Wire Line
	10800 850  10800 950 
Wire Wire Line
	10800 950  10950 950 
Wire Wire Line
	10950 950  10950 1000
Connection ~ 10800 950 
Wire Wire Line
	10800 950  10800 1050
$Comp
L power:GND #PWR0102
U 1 1 61D4FDAA
P 10950 1000
F 0 "#PWR0102" H 10950 750 50  0001 C CNN
F 1 "GND" H 10955 827 50  0000 C CNN
F 2 "" H 10950 1000 50  0001 C CNN
F 3 "" H 10950 1000 50  0001 C CNN
	1    10950 1000
	1    0    0    -1  
$EndComp
Text GLabel 4600 1100 2    50   Input ~ 0
OSC32_IN
Text GLabel 4600 1200 2    50   Input ~ 0
OSC32_OUT
Text GLabel 9850 850  0    50   Input ~ 0
OSC32_IN
Text GLabel 9850 1050 0    50   Input ~ 0
OSC32_OUT
Text GLabel 9850 1500 0    50   Input ~ 0
NRST
Text GLabel 4600 1700 2    50   Input ~ 0
NRST
Text GLabel 4600 1400 2    50   Input ~ 0
OSC_IN
Text GLabel 4600 1500 2    50   Input ~ 0
OSC_OUT
$Comp
L Device:C_Small C22
U 1 1 61D5C00A
P 10150 2200
F 0 "C22" V 9921 2200 50  0000 C CNN
F 1 "22pF" V 10012 2200 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 10150 2200 50  0001 C CNN
F 3 "~" H 10150 2200 50  0001 C CNN
	1    10150 2200
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C23
U 1 1 61D5C010
P 10550 2400
F 0 "C23" V 10321 2400 50  0000 C CNN
F 1 "22pF" V 10412 2400 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 10550 2400 50  0001 C CNN
F 3 "~" H 10550 2400 50  0001 C CNN
	1    10550 2400
	0    1    1    0   
$EndComp
Wire Wire Line
	10250 2200 10650 2200
Wire Wire Line
	10650 2200 10650 2300
Wire Wire Line
	10650 2300 10800 2300
Wire Wire Line
	10800 2300 10800 2350
Connection ~ 10650 2300
Wire Wire Line
	10650 2300 10650 2400
$Comp
L power:GND #PWR0103
U 1 1 61D5C020
P 10800 2350
F 0 "#PWR0103" H 10800 2100 50  0001 C CNN
F 1 "GND" H 10805 2177 50  0000 C CNN
F 2 "" H 10800 2350 50  0001 C CNN
F 3 "" H 10800 2350 50  0001 C CNN
	1    10800 2350
	1    0    0    -1  
$EndComp
Text GLabel 9700 2200 0    50   Input ~ 0
OSC_IN
Text GLabel 9700 2400 0    50   Input ~ 0
OSC_OUT
$Comp
L power:+3.3V #PWR0104
U 1 1 61D5C905
P 650 4900
F 0 "#PWR0104" H 650 4750 50  0001 C CNN
F 1 "+3.3V" H 665 5073 50  0000 C CNN
F 2 "" H 650 4900 50  0001 C CNN
F 3 "" H 650 4900 50  0001 C CNN
	1    650  4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	650  4900 650  5000
Connection ~ 650  5000
Wire Wire Line
	650  5000 650  5100
Connection ~ 650  5100
Wire Wire Line
	650  5100 650  5200
$Comp
L power:GND #PWR0105
U 1 1 61D5DB70
P 2400 5400
F 0 "#PWR0105" H 2400 5150 50  0001 C CNN
F 1 "GND" H 2405 5227 50  0000 C CNN
F 2 "" H 2400 5400 50  0001 C CNN
F 3 "" H 2400 5400 50  0001 C CNN
	1    2400 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 5000 2250 5100
Connection ~ 2250 5100
Wire Wire Line
	2250 5100 2250 5200
Wire Wire Line
	650  5600 650  5400
Connection ~ 650  5200
Connection ~ 650  5400
Wire Wire Line
	650  5400 650  5200
Wire Wire Line
	2250 5200 2250 5400
Connection ~ 2250 5200
Connection ~ 2250 5400
Text GLabel 1800 3500 0    50   Input ~ 0
BOOT0
Text GLabel 9900 3000 0    50   Input ~ 0
BOOT0
$Comp
L Switch:SW_SPDT SW2
U 1 1 61D6029B
P 10500 3000
F 0 "SW2" H 10500 3285 50  0000 C CNN
F 1 "SW_SPDT" H 10500 3194 50  0000 C CNN
F 2 "Button_Switch_SMD:SW_SPDT_JS202011JCQN" H 10500 3000 50  0001 C CNN
F 3 "~" H 10500 3000 50  0001 C CNN
	1    10500 3000
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0106
U 1 1 61D60A03
P 10700 2900
F 0 "#PWR0106" H 10700 2750 50  0001 C CNN
F 1 "+3.3V" H 10715 3073 50  0000 C CNN
F 2 "" H 10700 2900 50  0001 C CNN
F 3 "" H 10700 2900 50  0001 C CNN
	1    10700 2900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 61D60B77
P 10700 3100
F 0 "#PWR0107" H 10700 2850 50  0001 C CNN
F 1 "GND" H 10705 2927 50  0000 C CNN
F 2 "" H 10700 3100 50  0001 C CNN
F 3 "" H 10700 3100 50  0001 C CNN
	1    10700 3100
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R3
U 1 1 61D61459
P 10100 3000
F 0 "R3" V 9904 3000 50  0000 C CNN
F 1 "10k" V 9995 3000 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 10100 3000 50  0001 C CNN
F 3 "~" H 10100 3000 50  0001 C CNN
	1    10100 3000
	0    1    1    0   
$EndComp
Wire Wire Line
	10200 3000 10300 3000
Wire Wire Line
	10000 3000 9900 3000
Text GLabel 1100 2100 0    50   Input ~ 0
D-
$Comp
L Device:R_Small R1
U 1 1 61D64BBD
P 1250 2100
F 0 "R1" V 1054 2100 50  0000 C CNN
F 1 "22R" V 1145 2100 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 1250 2100 50  0001 C CNN
F 3 "~" H 1250 2100 50  0001 C CNN
	1    1250 2100
	0    1    1    0   
$EndComp
Wire Wire Line
	1100 2100 1150 2100
Wire Wire Line
	1350 2100 1800 2100
Text GLabel 1100 2200 0    50   Input ~ 0
D+
$Comp
L Device:R_Small R2
U 1 1 61D667BF
P 1250 2200
F 0 "R2" V 1350 2200 50  0000 C CNN
F 1 "22R" V 1450 2200 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 1250 2200 50  0001 C CNN
F 3 "~" H 1250 2200 50  0001 C CNN
	1    1250 2200
	0    1    1    0   
$EndComp
Wire Wire Line
	1100 2200 1150 2200
Wire Wire Line
	1350 2200 1800 2200
$Comp
L Connector:USB_B_Micro J1
U 1 1 61D6929C
P 10200 3950
F 0 "J1" H 10257 4417 50  0000 C CNN
F 1 "USB_B_Micro" H 10257 4326 50  0000 C CNN
F 2 "Connector_USB:USB_Micro-B_GCT_USB3076-30-A" H 10350 3900 50  0001 C CNN
F 3 "~" H 10350 3900 50  0001 C CNN
	1    10200 3950
	1    0    0    -1  
$EndComp
Text GLabel 10500 3950 2    50   Input ~ 0
D+
Text GLabel 10500 4050 2    50   Input ~ 0
D-
$Comp
L power:VCC #PWR0108
U 1 1 61D6D5B3
P 10600 3750
F 0 "#PWR0108" H 10600 3600 50  0001 C CNN
F 1 "VCC" H 10615 3923 50  0000 C CNN
F 2 "" H 10600 3750 50  0001 C CNN
F 3 "" H 10600 3750 50  0001 C CNN
	1    10600 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	10500 3750 10600 3750
NoConn ~ 10500 4150
$Comp
L power:GND #PWR0109
U 1 1 61D6F12D
P 10200 4350
F 0 "#PWR0109" H 10200 4100 50  0001 C CNN
F 1 "GND" H 10205 4177 50  0000 C CNN
F 2 "" H 10200 4350 50  0001 C CNN
F 3 "" H 10200 4350 50  0001 C CNN
	1    10200 4350
	1    0    0    -1  
$EndComp
$Comp
L Device:Fuse_Small F1
U 1 1 61D6F5E4
P 10400 4900
F 0 "F1" H 10400 5085 50  0000 C CNN
F 1 "Fuse_Small" H 10400 4994 50  0000 C CNN
F 2 "Fuse:Fuse_0805_2012Metric" H 10400 4900 50  0001 C CNN
F 3 "~" H 10400 4900 50  0001 C CNN
	1    10400 4900
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0110
U 1 1 61D6FB5F
P 10650 4900
F 0 "#PWR0110" H 10650 4750 50  0001 C CNN
F 1 "VCC" H 10665 5073 50  0000 C CNN
F 2 "" H 10650 4900 50  0001 C CNN
F 3 "" H 10650 4900 50  0001 C CNN
	1    10650 4900
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0111
U 1 1 61D700E5
P 10150 4900
F 0 "#PWR0111" H 10150 4750 50  0001 C CNN
F 1 "+5V" H 10165 5073 50  0000 C CNN
F 2 "" H 10150 4900 50  0001 C CNN
F 3 "" H 10150 4900 50  0001 C CNN
	1    10150 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	10150 4900 10300 4900
Wire Wire Line
	10500 4900 10650 4900
$Comp
L Regulator_Linear:TPS73133DBV U2
U 1 1 61D723CA
P 10400 5450
F 0 "U2" H 10400 5817 50  0000 C CNN
F 1 "TPS73133DBV" H 10400 5726 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5" H 10400 5775 50  0001 C CIN
F 3 "http://www.ti.com/lit/ds/symlink/tps731.pdf" H 10400 5400 50  0001 C CNN
	1    10400 5450
	1    0    0    -1  
$EndComp
NoConn ~ 10800 5450
$Comp
L power:+3.3V #PWR0112
U 1 1 61D73996
P 10900 5350
F 0 "#PWR0112" H 10900 5200 50  0001 C CNN
F 1 "+3.3V" H 10915 5523 50  0000 C CNN
F 2 "" H 10900 5350 50  0001 C CNN
F 3 "" H 10900 5350 50  0001 C CNN
	1    10900 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	10900 5350 10800 5350
$Comp
L Device:C_Small C25
U 1 1 61D7567B
P 10900 5600
F 0 "C25" H 10992 5646 50  0000 L CNN
F 1 "1uF" H 10992 5555 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 10900 5600 50  0001 C CNN
F 3 "~" H 10900 5600 50  0001 C CNN
	1    10900 5600
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C24
U 1 1 61D7599D
P 9850 5600
F 0 "C24" H 9942 5646 50  0000 L CNN
F 1 "1uF" H 9942 5555 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 9850 5600 50  0001 C CNN
F 3 "~" H 9850 5600 50  0001 C CNN
	1    9850 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	10000 5350 10000 5450
Wire Wire Line
	10000 5350 9850 5350
Wire Wire Line
	9850 5350 9850 5500
Connection ~ 10000 5350
$Comp
L power:+5V #PWR0113
U 1 1 61D7817E
P 9850 5350
F 0 "#PWR0113" H 9850 5200 50  0001 C CNN
F 1 "+5V" H 9865 5523 50  0000 C CNN
F 2 "" H 9850 5350 50  0001 C CNN
F 3 "" H 9850 5350 50  0001 C CNN
	1    9850 5350
	1    0    0    -1  
$EndComp
Connection ~ 9850 5350
Wire Wire Line
	10900 5350 10900 5500
Connection ~ 10900 5350
Wire Wire Line
	10900 5700 10900 5750
Wire Wire Line
	10900 5750 10400 5750
Wire Wire Line
	9850 5700 9850 5750
Wire Wire Line
	9850 5750 10400 5750
Connection ~ 10400 5750
Wire Wire Line
	10400 5750 10400 5850
$Comp
L power:GND #PWR0114
U 1 1 61D7C9A4
P 10400 5850
F 0 "#PWR0114" H 10400 5600 50  0001 C CNN
F 1 "GND" H 10405 5677 50  0000 C CNN
F 2 "" H 10400 5850 50  0001 C CNN
F 3 "" H 10400 5850 50  0001 C CNN
	1    10400 5850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0115
U 1 1 61D7D520
P 8100 1400
F 0 "#PWR0115" H 8100 1150 50  0001 C CNN
F 1 "GND" H 8105 1227 50  0000 C CNN
F 2 "" H 8100 1400 50  0001 C CNN
F 3 "" H 8100 1400 50  0001 C CNN
	1    8100 1400
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0116
U 1 1 61D7D786
P 8100 750
F 0 "#PWR0116" H 8100 600 50  0001 C CNN
F 1 "+3.3V" H 8115 923 50  0000 C CNN
F 2 "" H 8100 750 50  0001 C CNN
F 3 "" H 8100 750 50  0001 C CNN
	1    8100 750 
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C3
U 1 1 61D85F03
P 8000 1050
F 0 "C3" H 7950 1200 50  0000 L CNN
F 1 "0.1uF" H 7850 850 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 8000 1050 50  0001 C CNN
F 3 "~" H 8000 1050 50  0001 C CNN
	1    8000 1050
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C2
U 1 1 61D86797
P 7750 1050
F 0 "C2" H 7700 1200 50  0000 L CNN
F 1 "0.1uF" H 7600 850 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 7750 1050 50  0001 C CNN
F 3 "~" H 7750 1050 50  0001 C CNN
	1    7750 1050
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C4
U 1 1 61D86AFD
P 7500 1050
F 0 "C4" H 7450 1200 50  0000 L CNN
F 1 "0.1uF" H 7350 850 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 7500 1050 50  0001 C CNN
F 3 "~" H 7500 1050 50  0001 C CNN
	1    7500 1050
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C1
U 1 1 61D86EC9
P 7250 1050
F 0 "C1" H 7200 1200 50  0000 L CNN
F 1 "4.7uF" H 7100 850 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 7250 1050 50  0001 C CNN
F 3 "~" H 7250 1050 50  0001 C CNN
	1    7250 1050
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C14
U 1 1 61D87EBD
P 8250 1050
F 0 "C14" H 8200 1200 50  0000 L CNN
F 1 "10nF" H 8150 850 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 8250 1050 50  0001 C CNN
F 3 "~" H 8250 1050 50  0001 C CNN
	1    8250 1050
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C11
U 1 1 61D888D5
P 8500 1050
F 0 "C11" H 8450 1200 50  0000 L CNN
F 1 "1uF" H 8450 850 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 8500 1050 50  0001 C CNN
F 3 "~" H 8500 1050 50  0001 C CNN
	1    8500 1050
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C10
U 1 1 61D891BB
P 9000 1050
F 0 "C10" H 8950 1200 50  0000 L CNN
F 1 "1uF" H 8950 850 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 9000 1050 50  0001 C CNN
F 3 "~" H 9000 1050 50  0001 C CNN
	1    9000 1050
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C12
U 1 1 61D88C94
P 8750 1050
F 0 "C12" H 8700 1200 50  0000 L CNN
F 1 "0.1uF" H 8600 850 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 8750 1050 50  0001 C CNN
F 3 "~" H 8750 1050 50  0001 C CNN
	1    8750 1050
	1    0    0    -1  
$EndComp
Wire Wire Line
	8100 750  8100 950 
Wire Wire Line
	8100 950  8000 950 
Connection ~ 7500 950 
Wire Wire Line
	7500 950  7250 950 
Connection ~ 7750 950 
Wire Wire Line
	7750 950  7500 950 
Connection ~ 8000 950 
Wire Wire Line
	8000 950  7750 950 
Wire Wire Line
	8100 950  8250 950 
Connection ~ 8100 950 
Connection ~ 8250 950 
Wire Wire Line
	8250 950  8500 950 
Connection ~ 8500 950 
Wire Wire Line
	8500 950  8750 950 
Connection ~ 8750 950 
Wire Wire Line
	8750 950  9000 950 
Wire Wire Line
	9000 1150 8750 1150
Connection ~ 7500 1150
Wire Wire Line
	7500 1150 7250 1150
Connection ~ 7750 1150
Wire Wire Line
	7750 1150 7500 1150
Connection ~ 8000 1150
Wire Wire Line
	8000 1150 7750 1150
Connection ~ 8250 1150
Wire Wire Line
	8250 1150 8100 1150
Connection ~ 8500 1150
Wire Wire Line
	8500 1150 8250 1150
Connection ~ 8750 1150
Wire Wire Line
	8750 1150 8500 1150
Wire Wire Line
	8100 1150 8100 1400
Connection ~ 8100 1150
Wire Wire Line
	8100 1150 8000 1150
$Comp
L Switch:SW_SPST SW3
U 1 1 61D943C9
P 1150 3600
F 0 "SW3" H 1150 3835 50  0000 C CNN
F 1 "SW_SPST" H 1150 3744 50  0000 C CNN
F 2 "Button_Switch_SMD:SW_DIP_SPSTx01_DS04-254-2-01BK-SMT" H 1150 3600 50  0001 C CNN
F 3 "~" H 1150 3600 50  0001 C CNN
	1    1150 3600
	1    0    0    -1  
$EndComp
Text GLabel 1500 3600 3    50   Input ~ 0
B9
Wire Wire Line
	1350 3600 1800 3600
$Comp
L Device:LED_Small D1
U 1 1 61D97474
P 750 3600
F 0 "D1" H 750 3835 50  0000 C CNN
F 1 "LED_Small" H 750 3744 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric" V 750 3600 50  0001 C CNN
F 3 "~" V 750 3600 50  0001 C CNN
	1    750  3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	850  3600 950  3600
$Comp
L power:GND #PWR0117
U 1 1 61D99D93
P 650 3600
F 0 "#PWR0117" H 650 3350 50  0001 C CNN
F 1 "GND" H 655 3427 50  0000 C CNN
F 2 "" H 650 3600 50  0001 C CNN
F 3 "" H 650 3600 50  0001 C CNN
	1    650  3600
	1    0    0    -1  
$EndComp
Text GLabel 1800 1000 0    50   Input ~ 0
A0
Text GLabel 1800 1100 0    50   Input ~ 0
A1
Text GLabel 1800 1200 0    50   Input ~ 0
A2
Text GLabel 1800 1300 0    50   Input ~ 0
A3
Text GLabel 1800 1400 0    50   Input ~ 0
A4
Text GLabel 1800 1500 0    50   Input ~ 0
A5
Text GLabel 1800 1600 0    50   Input ~ 0
A6
Text GLabel 1800 1700 0    50   Input ~ 0
A7
Text GLabel 1800 1800 0    50   Input ~ 0
A8
Text GLabel 1800 1900 0    50   Input ~ 0
A9
Text GLabel 1800 2000 0    50   Input ~ 0
A10
Text GLabel 1800 2300 0    50   Input ~ 0
A13
Text GLabel 1800 2400 0    50   Input ~ 0
A14
Text GLabel 1800 2500 0    50   Input ~ 0
A15
Text GLabel 1800 2700 0    50   Input ~ 0
B0
Text GLabel 1800 2800 0    50   Input ~ 0
B1
Text GLabel 1800 2900 0    50   Input ~ 0
B2
Text GLabel 1800 3000 0    50   Input ~ 0
B3
Text GLabel 1800 3100 0    50   Input ~ 0
B4
Text GLabel 1800 3200 0    50   Input ~ 0
B5
Text GLabel 1800 3300 0    50   Input ~ 0
B6
Text GLabel 1800 3400 0    50   Input ~ 0
B7
Text GLabel 1800 3700 0    50   Input ~ 0
B10
Text GLabel 1800 3800 0    50   Input ~ 0
B11
Text GLabel 1800 3900 0    50   Input ~ 0
B12
Text GLabel 1800 4000 0    50   Input ~ 0
B13
Text GLabel 1800 4100 0    50   Input ~ 0
B14
Text GLabel 1800 4200 0    50   Input ~ 0
B15
Text GLabel 1450 2200 3    50   Input ~ 0
A12
Text GLabel 1450 2100 1    50   Input ~ 0
A11
Text GLabel 4600 1000 2    50   Input ~ 0
C13
$Comp
L Connector:TestPoint A2
U 1 1 61DD5E03
P 6500 2500
F 0 "A2" H 6558 2618 50  0000 L CNN
F 1 "TestPoint" H 6558 2527 50  0000 L CNN
F 2 "TestPoint:TestPoint_THTPad_D1.775mm_Drill1.2mm" H 6700 2500 50  0001 C CNN
F 3 "~" H 6700 2500 50  0001 C CNN
	1    6500 2500
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint A3
U 1 1 61DD5E09
P 6950 2500
F 0 "A3" H 7008 2618 50  0000 L CNN
F 1 "TestPoint" H 7008 2527 50  0000 L CNN
F 2 "TestPoint:TestPoint_THTPad_D1.775mm_Drill1.2mm" H 7150 2500 50  0001 C CNN
F 3 "~" H 7150 2500 50  0001 C CNN
	1    6950 2500
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint A4
U 1 1 61DDA934
P 5600 2800
F 0 "A4" H 5658 2918 50  0000 L CNN
F 1 "TestPoint" H 5658 2827 50  0000 L CNN
F 2 "TestPoint:TestPoint_THTPad_D1.775mm_Drill1.2mm" H 5800 2800 50  0001 C CNN
F 3 "~" H 5800 2800 50  0001 C CNN
	1    5600 2800
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint A5
U 1 1 61DDA93A
P 6050 2800
F 0 "A5" H 6108 2918 50  0000 L CNN
F 1 "TestPoint" H 6108 2827 50  0000 L CNN
F 2 "TestPoint:TestPoint_THTPad_D1.775mm_Drill1.2mm" H 6250 2800 50  0001 C CNN
F 3 "~" H 6250 2800 50  0001 C CNN
	1    6050 2800
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint A6
U 1 1 61DDA940
P 6500 2800
F 0 "A6" H 6558 2918 50  0000 L CNN
F 1 "TestPoint" H 6558 2827 50  0000 L CNN
F 2 "TestPoint:TestPoint_THTPad_D1.775mm_Drill1.2mm" H 6700 2800 50  0001 C CNN
F 3 "~" H 6700 2800 50  0001 C CNN
	1    6500 2800
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint A7
U 1 1 61DDA946
P 6950 2800
F 0 "A7" H 7008 2918 50  0000 L CNN
F 1 "TestPoint" H 7008 2827 50  0000 L CNN
F 2 "TestPoint:TestPoint_THTPad_D1.775mm_Drill1.2mm" H 7150 2800 50  0001 C CNN
F 3 "~" H 7150 2800 50  0001 C CNN
	1    6950 2800
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint A8
U 1 1 61DDCBE1
P 5600 3100
F 0 "A8" H 5658 3218 50  0000 L CNN
F 1 "TestPoint" H 5658 3127 50  0000 L CNN
F 2 "TestPoint:TestPoint_THTPad_D1.775mm_Drill1.2mm" H 5800 3100 50  0001 C CNN
F 3 "~" H 5800 3100 50  0001 C CNN
	1    5600 3100
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint A9
U 1 1 61DDCBE7
P 6050 3100
F 0 "A9" H 6108 3218 50  0000 L CNN
F 1 "TestPoint" H 6108 3127 50  0000 L CNN
F 2 "TestPoint:TestPoint_THTPad_D1.775mm_Drill1.2mm" H 6250 3100 50  0001 C CNN
F 3 "~" H 6250 3100 50  0001 C CNN
	1    6050 3100
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint A10
U 1 1 61DDCBED
P 6500 3100
F 0 "A10" H 6558 3218 50  0000 L CNN
F 1 "TestPoint" H 6558 3127 50  0000 L CNN
F 2 "TestPoint:TestPoint_THTPad_D1.775mm_Drill1.2mm" H 6700 3100 50  0001 C CNN
F 3 "~" H 6700 3100 50  0001 C CNN
	1    6500 3100
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint A11
U 1 1 61DDCBF3
P 6950 3100
F 0 "A11" H 7008 3218 50  0000 L CNN
F 1 "TestPoint" H 7008 3127 50  0000 L CNN
F 2 "TestPoint:TestPoint_THTPad_D1.775mm_Drill1.2mm" H 7150 3100 50  0001 C CNN
F 3 "~" H 7150 3100 50  0001 C CNN
	1    6950 3100
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint A12
U 1 1 61DDEF10
P 5600 3400
F 0 "A12" H 5658 3518 50  0000 L CNN
F 1 "TestPoint" H 5658 3427 50  0000 L CNN
F 2 "TestPoint:TestPoint_THTPad_D1.775mm_Drill1.2mm" H 5800 3400 50  0001 C CNN
F 3 "~" H 5800 3400 50  0001 C CNN
	1    5600 3400
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint A13
U 1 1 61DDEF16
P 6050 3400
F 0 "A13" H 6108 3518 50  0000 L CNN
F 1 "TestPoint" H 6108 3427 50  0000 L CNN
F 2 "TestPoint:TestPoint_THTPad_D1.775mm_Drill1.2mm" H 6250 3400 50  0001 C CNN
F 3 "~" H 6250 3400 50  0001 C CNN
	1    6050 3400
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint A14
U 1 1 61DDEF1C
P 6500 3400
F 0 "A14" H 6558 3518 50  0000 L CNN
F 1 "TestPoint" H 6558 3427 50  0000 L CNN
F 2 "TestPoint:TestPoint_THTPad_D1.775mm_Drill1.2mm" H 6700 3400 50  0001 C CNN
F 3 "~" H 6700 3400 50  0001 C CNN
	1    6500 3400
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint A15
U 1 1 61DDEF22
P 6950 3400
F 0 "A15" H 7008 3518 50  0000 L CNN
F 1 "TestPoint" H 7008 3427 50  0000 L CNN
F 2 "TestPoint:TestPoint_THTPad_D1.775mm_Drill1.2mm" H 7150 3400 50  0001 C CNN
F 3 "~" H 7150 3400 50  0001 C CNN
	1    6950 3400
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint A1
U 1 1 61DD4F8B
P 6050 2500
F 0 "A1" H 6108 2618 50  0000 L CNN
F 1 "TestPoint" H 6108 2527 50  0000 L CNN
F 2 "TestPoint:TestPoint_THTPad_D1.775mm_Drill1.2mm" H 6250 2500 50  0001 C CNN
F 3 "~" H 6250 2500 50  0001 C CNN
	1    6050 2500
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint A0
U 1 1 61DD488A
P 5600 2500
F 0 "A0" H 5658 2618 50  0000 L CNN
F 1 "TestPoint" H 5658 2527 50  0000 L CNN
F 2 "TestPoint:TestPoint_THTPad_D1.775mm_Drill1.2mm" H 5800 2500 50  0001 C CNN
F 3 "~" H 5800 2500 50  0001 C CNN
	1    5600 2500
	1    0    0    -1  
$EndComp
Text GLabel 5600 2500 0    50   Input ~ 0
A0
Text GLabel 6050 2500 0    50   Input ~ 0
A1
Text GLabel 6500 2500 0    50   Input ~ 0
A2
Text GLabel 6950 2500 0    50   Input ~ 0
A3
Text GLabel 5600 2800 0    50   Input ~ 0
A4
Text GLabel 6050 2800 0    50   Input ~ 0
A5
Text GLabel 6500 2800 0    50   Input ~ 0
A6
Text GLabel 6950 2800 0    50   Input ~ 0
A7
Text GLabel 5600 3100 0    50   Input ~ 0
A8
Text GLabel 6050 3100 0    50   Input ~ 0
A9
Text GLabel 6500 3100 0    50   Input ~ 0
A10
Text GLabel 6950 3100 0    50   Input ~ 0
A11
Text GLabel 5600 3400 0    50   Input ~ 0
A12
Text GLabel 6050 3400 0    50   Input ~ 0
A13
Text GLabel 6500 3400 0    50   Input ~ 0
A14
Text GLabel 6950 3400 0    50   Input ~ 0
A15
$Comp
L Connector:TestPoint B0
U 1 1 61DF0F34
P 5600 3900
F 0 "B0" H 5658 4018 50  0000 L CNN
F 1 "TestPoint" H 5658 3927 50  0000 L CNN
F 2 "TestPoint:TestPoint_THTPad_D1.775mm_Drill1.2mm" H 5800 3900 50  0001 C CNN
F 3 "~" H 5800 3900 50  0001 C CNN
	1    5600 3900
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint B1
U 1 1 61DF5FC5
P 6050 3900
F 0 "B1" H 6108 4018 50  0000 L CNN
F 1 "TestPoint" H 6108 3927 50  0000 L CNN
F 2 "TestPoint:TestPoint_THTPad_D1.775mm_Drill1.2mm" H 6250 3900 50  0001 C CNN
F 3 "~" H 6250 3900 50  0001 C CNN
	1    6050 3900
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint B2
U 1 1 61DF62C8
P 6500 3900
F 0 "B2" H 6558 4018 50  0000 L CNN
F 1 "TestPoint" H 6558 3927 50  0000 L CNN
F 2 "TestPoint:TestPoint_THTPad_D1.775mm_Drill1.2mm" H 6700 3900 50  0001 C CNN
F 3 "~" H 6700 3900 50  0001 C CNN
	1    6500 3900
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint B3
U 1 1 61DF65A9
P 6950 3900
F 0 "B3" H 7008 4018 50  0000 L CNN
F 1 "TestPoint" H 7008 3927 50  0000 L CNN
F 2 "TestPoint:TestPoint_THTPad_D1.775mm_Drill1.2mm" H 7150 3900 50  0001 C CNN
F 3 "~" H 7150 3900 50  0001 C CNN
	1    6950 3900
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint B4
U 1 1 61DF8698
P 5600 4200
F 0 "B4" H 5658 4318 50  0000 L CNN
F 1 "TestPoint" H 5658 4227 50  0000 L CNN
F 2 "TestPoint:TestPoint_THTPad_D1.775mm_Drill1.2mm" H 5800 4200 50  0001 C CNN
F 3 "~" H 5800 4200 50  0001 C CNN
	1    5600 4200
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint B5
U 1 1 61DF869E
P 6050 4200
F 0 "B5" H 6108 4318 50  0000 L CNN
F 1 "TestPoint" H 6108 4227 50  0000 L CNN
F 2 "TestPoint:TestPoint_THTPad_D1.775mm_Drill1.2mm" H 6250 4200 50  0001 C CNN
F 3 "~" H 6250 4200 50  0001 C CNN
	1    6050 4200
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint B6
U 1 1 61DF86A4
P 6500 4200
F 0 "B6" H 6558 4318 50  0000 L CNN
F 1 "TestPoint" H 6558 4227 50  0000 L CNN
F 2 "TestPoint:TestPoint_THTPad_D1.775mm_Drill1.2mm" H 6700 4200 50  0001 C CNN
F 3 "~" H 6700 4200 50  0001 C CNN
	1    6500 4200
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint B7
U 1 1 61DF86AA
P 6950 4200
F 0 "B7" H 7008 4318 50  0000 L CNN
F 1 "TestPoint" H 7008 4227 50  0000 L CNN
F 2 "TestPoint:TestPoint_THTPad_D1.775mm_Drill1.2mm" H 7150 4200 50  0001 C CNN
F 3 "~" H 7150 4200 50  0001 C CNN
	1    6950 4200
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint B9
U 1 1 61DFA83D
P 6050 4500
F 0 "B9" H 6108 4618 50  0000 L CNN
F 1 "TestPoint" H 6108 4527 50  0000 L CNN
F 2 "TestPoint:TestPoint_THTPad_D1.775mm_Drill1.2mm" H 6250 4500 50  0001 C CNN
F 3 "~" H 6250 4500 50  0001 C CNN
	1    6050 4500
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint B10
U 1 1 61DFA843
P 6500 4500
F 0 "B10" H 6558 4618 50  0000 L CNN
F 1 "TestPoint" H 6558 4527 50  0000 L CNN
F 2 "TestPoint:TestPoint_THTPad_D1.775mm_Drill1.2mm" H 6700 4500 50  0001 C CNN
F 3 "~" H 6700 4500 50  0001 C CNN
	1    6500 4500
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint B11
U 1 1 61DFA849
P 6950 4500
F 0 "B11" H 7008 4618 50  0000 L CNN
F 1 "TestPoint" H 7008 4527 50  0000 L CNN
F 2 "TestPoint:TestPoint_THTPad_D1.775mm_Drill1.2mm" H 7150 4500 50  0001 C CNN
F 3 "~" H 7150 4500 50  0001 C CNN
	1    6950 4500
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint B12
U 1 1 61DFCD5A
P 5600 4800
F 0 "B12" H 5658 4918 50  0000 L CNN
F 1 "TestPoint" H 5658 4827 50  0000 L CNN
F 2 "TestPoint:TestPoint_THTPad_D1.775mm_Drill1.2mm" H 5800 4800 50  0001 C CNN
F 3 "~" H 5800 4800 50  0001 C CNN
	1    5600 4800
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint B13
U 1 1 61DFCD60
P 6050 4800
F 0 "B13" H 6108 4918 50  0000 L CNN
F 1 "TestPoint" H 6108 4827 50  0000 L CNN
F 2 "TestPoint:TestPoint_THTPad_D1.775mm_Drill1.2mm" H 6250 4800 50  0001 C CNN
F 3 "~" H 6250 4800 50  0001 C CNN
	1    6050 4800
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint B14
U 1 1 61DFCD66
P 6500 4800
F 0 "B14" H 6558 4918 50  0000 L CNN
F 1 "TestPoint" H 6558 4827 50  0000 L CNN
F 2 "TestPoint:TestPoint_THTPad_D1.775mm_Drill1.2mm" H 6700 4800 50  0001 C CNN
F 3 "~" H 6700 4800 50  0001 C CNN
	1    6500 4800
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint B15
U 1 1 61DFCD6C
P 6950 4800
F 0 "B15" H 7008 4918 50  0000 L CNN
F 1 "TestPoint" H 7008 4827 50  0000 L CNN
F 2 "TestPoint:TestPoint_THTPad_D1.775mm_Drill1.2mm" H 7150 4800 50  0001 C CNN
F 3 "~" H 7150 4800 50  0001 C CNN
	1    6950 4800
	1    0    0    -1  
$EndComp
Text GLabel 5600 3900 0    50   Input ~ 0
B0
Text GLabel 6050 3900 0    50   Input ~ 0
B1
Text GLabel 6500 3900 0    50   Input ~ 0
B2
Text GLabel 6950 3900 0    50   Input ~ 0
B3
Text GLabel 5600 4200 0    50   Input ~ 0
B4
Text GLabel 6050 4200 0    50   Input ~ 0
B5
Text GLabel 6500 4200 0    50   Input ~ 0
B6
Text GLabel 6950 4200 0    50   Input ~ 0
B7
Text GLabel 6050 4500 0    50   Input ~ 0
B9
Text GLabel 6500 4500 0    50   Input ~ 0
B10
Text GLabel 6950 4500 0    50   Input ~ 0
B11
Text GLabel 5600 4800 0    50   Input ~ 0
B12
Text GLabel 6050 4800 0    50   Input ~ 0
B13
Text GLabel 6500 4800 0    50   Input ~ 0
B14
Text GLabel 6950 4800 0    50   Input ~ 0
B15
$Comp
L Connector:TestPoint PC13
U 1 1 61E08906
P 5600 5250
F 0 "PC13" H 5658 5368 50  0000 L CNN
F 1 "TestPoint" H 5658 5277 50  0000 L CNN
F 2 "TestPoint:TestPoint_THTPad_D1.775mm_Drill1.2mm" H 5800 5250 50  0001 C CNN
F 3 "~" H 5800 5250 50  0001 C CNN
	1    5600 5250
	1    0    0    -1  
$EndComp
Text GLabel 5600 5250 0    50   Input ~ 0
C13
$Comp
L Connector:TestPoint 3v3
U 1 1 61E08FBB
P 5600 5700
F 0 "3v3" H 5658 5818 50  0000 L CNN
F 1 "TestPoint" H 5658 5727 50  0000 L CNN
F 2 "TestPoint:TestPoint_THTPad_D1.775mm_Drill1.2mm" H 5800 5700 50  0001 C CNN
F 3 "~" H 5800 5700 50  0001 C CNN
	1    5600 5700
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint 3V3
U 1 1 61E09533
P 6100 5700
F 0 "3V3" H 6158 5818 50  0000 L CNN
F 1 "TestPoint" H 6158 5727 50  0000 L CNN
F 2 "TestPoint:TestPoint_THTPad_D1.775mm_Drill1.2mm" H 6300 5700 50  0001 C CNN
F 3 "~" H 6300 5700 50  0001 C CNN
	1    6100 5700
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint 5V0
U 1 1 61E09A26
P 6550 5700
F 0 "5V0" H 6608 5818 50  0000 L CNN
F 1 "TestPoint" H 6608 5727 50  0000 L CNN
F 2 "TestPoint:TestPoint_THTPad_D1.775mm_Drill1.2mm" H 6750 5700 50  0001 C CNN
F 3 "~" H 6750 5700 50  0001 C CNN
	1    6550 5700
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint GND0
U 1 1 61E0A76B
P 5550 6000
F 0 "GND0" H 5608 6118 50  0000 L CNN
F 1 "TestPoint" H 5608 6027 50  0000 L CNN
F 2 "TestPoint:TestPoint_THTPad_D1.775mm_Drill1.2mm" H 5750 6000 50  0001 C CNN
F 3 "~" H 5750 6000 50  0001 C CNN
	1    5550 6000
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint GND1
U 1 1 61E0A771
P 6050 6000
F 0 "GND1" H 6108 6118 50  0000 L CNN
F 1 "TestPoint" H 6108 6027 50  0000 L CNN
F 2 "TestPoint:TestPoint_THTPad_D1.775mm_Drill1.2mm" H 6250 6000 50  0001 C CNN
F 3 "~" H 6250 6000 50  0001 C CNN
	1    6050 6000
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint GND2
U 1 1 61E0A777
P 6500 6000
F 0 "GND2" H 6558 6118 50  0000 L CNN
F 1 "TestPoint" H 6558 6027 50  0000 L CNN
F 2 "TestPoint:TestPoint_THTPad_D1.775mm_Drill1.2mm" H 6700 6000 50  0001 C CNN
F 3 "~" H 6700 6000 50  0001 C CNN
	1    6500 6000
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0118
U 1 1 61E0C4E9
P 5600 5700
F 0 "#PWR0118" H 5600 5550 50  0001 C CNN
F 1 "+3V3" V 5615 5828 50  0000 L CNN
F 2 "" H 5600 5700 50  0001 C CNN
F 3 "" H 5600 5700 50  0001 C CNN
	1    5600 5700
	0    -1   -1   0   
$EndComp
$Comp
L power:+3V3 #PWR0119
U 1 1 61E0C873
P 6100 5700
F 0 "#PWR0119" H 6100 5550 50  0001 C CNN
F 1 "+3V3" V 6115 5828 50  0000 L CNN
F 2 "" H 6100 5700 50  0001 C CNN
F 3 "" H 6100 5700 50  0001 C CNN
	1    6100 5700
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0120
U 1 1 61E0D4E5
P 5550 6000
F 0 "#PWR0120" H 5550 5750 50  0001 C CNN
F 1 "GND" H 5555 5827 50  0000 C CNN
F 2 "" H 5550 6000 50  0001 C CNN
F 3 "" H 5550 6000 50  0001 C CNN
	1    5550 6000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0121
U 1 1 61E0D54F
P 6050 6000
F 0 "#PWR0121" H 6050 5750 50  0001 C CNN
F 1 "GND" H 6055 5827 50  0000 C CNN
F 2 "" H 6050 6000 50  0001 C CNN
F 3 "" H 6050 6000 50  0001 C CNN
	1    6050 6000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0122
U 1 1 61E0DAA3
P 6500 6000
F 0 "#PWR0122" H 6500 5750 50  0001 C CNN
F 1 "GND" H 6505 5827 50  0000 C CNN
F 2 "" H 6500 6000 50  0001 C CNN
F 3 "" H 6500 6000 50  0001 C CNN
	1    6500 6000
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0123
U 1 1 61E12ED3
P 6550 5700
F 0 "#PWR0123" H 6550 5550 50  0001 C CNN
F 1 "+5V" V 6565 5828 50  0000 L CNN
F 2 "" H 6550 5700 50  0001 C CNN
F 3 "" H 6550 5700 50  0001 C CNN
	1    6550 5700
	0    1    1    0   
$EndComp
Wire Wire Line
	9700 2200 9950 2200
Wire Wire Line
	9700 2400 9950 2400
$Comp
L Device:Crystal_GND24_Small Y1
U 1 1 61E59046
P 9950 2300
F 0 "Y1" V 9904 2444 50  0000 L CNN
F 1 "Crystal_GND24_Small" V 9995 2444 50  0000 L CNN
F 2 "Crystal:Crystal_SMD_3225-4Pin_3.2x2.5mm" H 9950 2300 50  0001 C CNN
F 3 "~" H 9950 2300 50  0001 C CNN
	1    9950 2300
	0    1    1    0   
$EndComp
Connection ~ 9950 2200
Wire Wire Line
	9950 2200 10050 2200
Connection ~ 9950 2400
Wire Wire Line
	9950 2400 10450 2400
Wire Wire Line
	10050 2300 9850 2300
Wire Wire Line
	10050 2300 10650 2300
Connection ~ 10050 2300
Wire Wire Line
	2250 5400 2400 5400
$Comp
L power:+3V3 #PWR0124
U 1 1 61F47B2B
P 2250 5600
F 0 "#PWR0124" H 2250 5450 50  0001 C CNN
F 1 "+3V3" H 2265 5773 50  0000 C CNN
F 2 "" H 2250 5600 50  0001 C CNN
F 3 "" H 2250 5600 50  0001 C CNN
	1    2250 5600
	1    0    0    -1  
$EndComp
$EndSCHEMATC