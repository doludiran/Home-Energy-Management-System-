# Home-Energy-Management-System-
This system retrieves dynamic electricity pricing information from a utility portal and automatically schedules  large residential loads like EV charging to reduce the overall cost of energy consumed 

The design involves and consists of:
• A Central Control Unit using a Linux based Raspberry Pi programmed in Python. Components of this unit included a touch screen graphic
user interface, secure Internet interface for the automatic retrieval of dynamic pricing information from a utility web portal and xbee wireless
communication interface (zigbee) for remote switching as well as load telemetry data transmission
• A Device Energy Monitoring Unit using an ARM Cortex-M3 based Microcontroller. Components of this unit included a xbee wireless interface
(zigbee) for transmitting monitoring data as well as receiving switching commands from the Central Control Unit, Analog Circuitry for AC load
switching and power consumption measurement (AC Voltage and Current)
• An optimization algorithm to minimize power cost using SciPY
• Multi-threaded programming in c and Python
• Printed Circuit Boards (PCB) design including soldering of Surface-Mount ICs (SMT)
• Hardware and printed circuit board testing and validation
• Component selection and assembly designed to comply with CSA standards
