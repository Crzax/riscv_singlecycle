# 武汉大学2023-2024学年 计卓班 计算机组成与设计 RISC-V CPU 单周期设计

[![Vivado](https://img.shields.io/badge/Vivado-2018.1-blue.svg)](https://www.xilinx.com/products/design-tools/vivado.html) [![ModelSim](https://img.shields.io/badge/ModelSim-10.6d-green.svg)](https://www.mentor.com/company/high-level_synthesis/modelsim)

[English Version](readme-en.md)

## 项目概览

### 仿真环境

- **Vivado 2018.1**: 用于FPGA设计的综合与实现。
- **ModelSim 10.6d**: 用于RTL级仿真验证。

### 目录结构

- **modelsim**: 包含用于`modelsim`仿真的Verilog代码，这些代码已经通过了`test`文件夹中的测试用例验证。
- **test**: 包含用于验证单周期CPU设计的测试用例，以及用于`vivado`测试的程序（以.coe文件形式提供）。
- **vivado**: 包含在FPGA（**NEXYS A7**）上实现单周期CPU设计所需的全部文件，包括约束文件、顶层模块文件和CPU实现文件。

## 使用指南

### 仿真验证

1. **Modelsim仿真**: 在`modelsim`文件夹中，可以找到经过测试的Verilog代码，用于在ModelSim中进行仿真验证。确保您的仿真环境配置正确，并运行提供的测试用例以验证设计的功能性。

2. **测试用例**: 在`test`文件夹中，可以找到一系列的测试用例，这些用例旨在覆盖CPU设计的各种操作和边界条件。使用这些测试用例来确保您的单周期CPU设计能够正确执行RISC-V指令集。

### FPGA实现

1. **Vivado工程**: 在`vivado`文件夹中，将找到一个完整的Vivado工程，该工程包含了在NEXYS A7 FPGA上实现单周期CPU设计所需的所有文件。按照Vivado的使用指南，加载工程并进行综合、实现和生成比特流。

2. **约束文件**: 确保FPGA板级约束文件（.xdc）正确配置了引脚分配和其他时序约束，以确保设计的正确运行。

3. **顶层模块**: 顶层模块文件定义了整个设计的接口和连接。确保所有子模块正确连接，并且顶层模块的实例化符合设计规范。

## 注意事项

- 在使用本项目时，请确保遵循上述指南和注意事项。
- 如果需要实现额外的指令或功能，请根据代码逻辑进行补充，并确保通过相应的测试用例验证。
