 # Wuhan University 2023-2024 Academic Year Elite Class in Computer Science Computer Organization and Design RISC-V CPU Pipelining Design

[![Vivado](https://img.shields.io/badge/Vivado-2018.1-blue.svg)](https://www.xilinx.com/products/design-tools/vivado.html) [![ModelSim](https://img.shields.io/badge/ModelSim-10.6d-green.svg)](https://www.mentor.com/company/high-level_synthesis/modelsim)

[中文版本](readme.md)

## Project Overview

### Simulation Environment

- **Vivado 2018.1**: Used for synthesis and implementation of FPGA designs.
- **ModelSim 10.6d**: Used for RTL-level simulation verification.

### Directory Structure

- **modelsim**: Contains Verilog code for `modelsim` simulation, which has been verified through test cases in the `test` folder.
- **test**: Contains test cases for verifying the pipelined CPU design, as well as programs for `vivado` testing (provided in .coe file format).
- **vivado**: Contains all the files necessary for implementing the pipelined CPU design on an FPGA (**NEXYS A7**), including constraint files, top-level module files, and CPU implementation files.

## Usage Guide

### Simulation Verification

1. **Modelsim Simulation**: In the `modelsim` folder, you can find tested Verilog code for simulation verification in ModelSim. Ensure your simulation environment is correctly configured and run the provided test cases to verify the functionality of the design.

2. **Test Cases**: In the `test` folder, you can find a series of test cases designed to cover various operations and boundary conditions of the CPU design. Use these test cases to ensure your pipelined CPU design correctly executes the RISC-V instruction set.

### FPGA Implementation

1. **Vivado Project**: In the `vivado` folder, you will find a complete Vivado project that includes all the files needed to implement the pipelined CPU design on a NEXYS A7 FPGA. Follow the Vivado user guide to load the project, perform synthesis, implementation, and generate the bitstream.

2. **Constraint Files**: Ensure your FPGA board-level constraint files (.xdc) are correctly configured with pin assignments and other timing constraints to ensure the correct operation of the design.

3. **Top-Level Module**: The top-level module file defines the interfaces and connections of the entire design. Ensure all sub-modules are correctly connected, and the instantiation of the top-level module complies with the design specifications.

## Notes

- When using this project, please ensure you follow the above guidelines and notes.
- If you need to implement additional instructions or features, please supplement them according to the code logic and ensure they are validated through the corresponding test cases.
