## Basys 3 UART Communication System using Verilog HDL

A UART (Universal Asynchronous Receiver Transmitter) communication system designed and implemented in Verilog HDL using a modular RTL architecture, targeting the Digilent Basys 3 FPGA board (Xilinx Artix-7). The design implements UART transmission and reception using separate FSM-based TX and RX modules, along with a dedicated baud rate generator, button-triggered transmission, and LED / seven-segment display interfacing for real-time hardware validation.

The transmitter converts 8-bit parallel data (from the on-board switches) into a serial stream, and the receiver reconstructs an # Basys 3 UART Communication System using Verilog HDL

A UART (Universal Asynchronous Receiver Transmitter) communication system designed and implemented in Verilog HDL using a modular RTL architecture, targeting the Digilent Basys 3 FPGA board (Xilinx Artix-7). The design implements UART transmission and reception using separate FSM-based TX and RX modules, along with a dedicated baud rate generator, button-triggered transmission, and LED / seven-segment display interfacing for real-time hardware validation.

The transmitter converts 8-bit parallel data (from the on-board switches) into a serial stream, and the receiver reconstructs an incoming serial stream back into 8-bit parallel data, which is displayed on the LEDs and the seven-segment display.

## UART Configuration

| Parameter | Value |
|---|---|
| Clock Frequency | 100 MHz |
| Baud Rate | 9600 |
| Data Bits | 8 |
| Stop Bits | 1 |
| Parity | None |

The baud rate generator was designed for 9600 baud communication using the 100 MHz Basys 3 onboard clock, generating separate timing enables for the transmitter and a 16x-oversampled enable for the receiver.

## Project Overview

This project implements a UART communication system using Verilog HDL, split into clean, modular RTL blocks. The system was:

- Designed using Verilog HDL
- Synthesized and implemented using Xilinx Vivado
- Deployed on the Basys 3 FPGA board
- Tested using switch input, button-triggered transmission, and a serial terminal, with received data verified on LEDs and the seven-segment display

## Project Files

| File | Description |
|---|---|
| top.v | FPGA top-level module — connects TX, RX, baud generator, switches, button, LEDs, and 7-segment display |
| Transmitter.v | UART transmitter (FSM-based) |
| Receiver.v | UART receiver (FSM-based, 16x oversampling) |
| baud_rate_generator.v | Baud rate / clock-enable generator for TX and RX |
| constraints_uart.xdc | Basys 3 pin and I/O constraints (Xilinx Vivado) |

## Key Features

- UART transmitter and receiver implementation
- FSM-based serial communication
- 9600 baud rate operation
- Standard 8N1 UART frame format
- Modular RTL design
- Separate TX and RX baud tick generation
- Push-button triggered transmission
- LED and seven-segment display interfacing
- FPGA hardware verification on Basys 3

## Hardware Verification

The design was synthesized and implemented on the Basys 3 FPGA board using Xilinx Vivado. Switch values are transmitted serially on a button press, and data received over the UART line is reconstructed by the receiver and displayed on the on-board LEDs and seven-segment display for real-time verification. UART communication was tested using a serial terminal connected via the board's USB-UART interface.

## Tools and Technologies Used

- Verilog HDL
- Xilinx Vivado
- Basys 3 FPGA Board
- Serial terminal (e.g. PuTTY / Tera Term) for UART testingincoming serial stream back into 8-bit parallel data, which is displayed on the LEDs and the seven-segment display.

UART Configuration
Parameter	Value
Clock Frequency	100 MHz
Baud Rate	9600
Data Bits	8
Stop Bits	1
Parity	None

The baud rate generator was designed for 9600 baud communication using the 100 MHz Basys 3 onboard clock, generating separate timing enables for the transmitter and a 16x-oversampled enable for the receiver.

Project Overview

This project implements a UART communication system using Verilog HDL, split into clean, modular RTL blocks. The system was:

Designed using Verilog HDL
Synthesized and implemented using Xilinx Vivado
Deployed on the Basys 3 FPGA board
Tested using switch input, button-triggered transmission, and a serial terminal, with received data verified on LEDs and the seven-segment display
Project Files
File	Description
top.v	FPGA top-level module — connects TX, RX, baud generator, switches, button, LEDs, and 7-segment display
Transmitter.v	UART transmitter (FSM-based)
Receiver.v	UART receiver (FSM-based, 16x oversampling)
baud_rate_generator.v	Baud rate / clock-enable generator for TX and RX
constraints_uart.xdc	Basys 3 pin and I/O constraints (Xilinx Vivado)
Key Features
UART transmitter and receiver implementation
FSM-based serial communication
9600 baud rate operation
Standard 8N1 UART frame format
Modular RTL design
Separate TX and RX baud tick generation
Push-button triggered transmission
LED and seven-segment display interfacing
FPGA hardware verification on Basys 3
Hardware Verification

The design was synthesized and implemented on the Basys 3 FPGA board using Xilinx Vivado. Switch values are transmitted serially on a button press, and data received over the UART line is reconstructed by the receiver and displayed on the on-board LEDs and seven-segment display for real-time verification. UART communication was tested using a serial terminal connected via the board's USB-UART interface.

Tools and Technologies Used
Verilog HDL
Xilinx Vivado
Basys 3 FPGA Board
Serial terminal (e.g. PuTTY / Tera Term) for UART testing
