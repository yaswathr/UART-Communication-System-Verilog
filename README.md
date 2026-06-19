# UART Communication System

## Overview

This project implements a Universal Asynchronous Receiver Transmitter (UART) communication system using Verilog HDL. The design includes a Baud Rate Generator, UART Transmitter (TX), and UART Receiver (RX) to enable reliable asynchronous serial communication between digital systems.

## Features

* Configurable Baud Rate Generator
* UART Transmitter (TX)
* UART Receiver (RX)
* FSM-Based Design
* 8-bit Data Communication
* Start and Stop Bit Handling
* Functional Verification using Testbench
* Simulation Waveform Analysis

## Architecture

The UART system consists of:

1. **Baud Generator** – Generates baud timing pulses from the system clock.
2. **UART TX Module** – Converts parallel data into serial format.
3. **UART RX Module** – Converts serial data back into parallel format.
4. **TX Line** – Communication channel between transmitter and receiver.

## UART Frame Format

```text
| Start Bit | 8 Data Bits | Stop Bit |
|     0     | D0-D7       |     1    |
```

Data is transmitted LSB first.

## Finite State Machines

### UART Transmitter FSM


IDLE → START → DATA → STOP → IDLE


### UART Receiver FSM

IDLE → START → DATA → STOP → IDLE


## Simulation Results

The design was verified using ModelSim.

### Test Cases

| Transmitted Data | Received Data |
| ---------------- | ------------- |
| 0x41             | 0x41          |
| 0x55             | 0x55          |
| 0xAA             | 0xAA          |

### Console Output

```text
Received Data = 41
Received Data = 55
Received Data = aa
```

## Tools Used

* Verilog HDL
* ModelSim
* GitHub

## Applications

* Embedded Systems
* FPGA-Based Designs
* Serial Communication Interfaces
* IoT Devices
* Microcontroller Communication

## Future Enhancements

* Parity Bit Support
* FIFO Buffer Integration
* Error Detection Mechanisms
* Multiple Baud Rate Support
* FPGA Hardware Implementation

## Author

**Yaswanth Sharma**
B.E. Electronics and Communication Engineering
VLSI  Enthusiast
Bannari Amman Institute Of Techmology.
