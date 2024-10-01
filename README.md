# MIPS 32 Microprocessor

This project implements a MIPS 32 microprocessor using Verilog in Xilinx Vivado. It follows the RISC architecture and supports a wide range of instructions and addressing modes. The processor is capable of accurately executing assembly language programs and provides robust functionality for real-world applications.

## Features

- **32 General-Purpose Registers (GPRs):** 32-bit wide registers for data storage and manipulation.
- **32-bit Program Counter (PC):** To track the current instruction.
  
### Instruction Formats Supported
- **R-type:** Operations using registers (e.g., addition, subtraction, logical operations).
- **I-type:** Operations using immediate values, such as loading data from memory, arithmetic with constants.
- **J-type:** Jump instructions for procedure calls and unconditional jumps.

### Addressing Modes Supported
- **Register Addressing:** Operands are located in registers (used in R-type instructions).
- **Immediate Addressing:** A constant value is encoded within the instruction.
- **Base Addressing:** A base register plus an offset determines the memory address.
- **PC-relative Addressing:** Addresses are computed relative to the Program Counter (used for branch instructions).
- **Pseudo-direct Addressing:** A portion of the address is combined with the PC for jump instructions.

## Tools Used

- **Xilinx Vivado**: For synthesis and simulation.
- **Verilog**: Hardware description language used for the implementation.

## Project Structure

```plaintext
|-- src/
|   |-- datapath.v           # Datapath design
|   |-- control_unit.v       # Control unit logic
|   |-- memory.v             # Memory management
|
|-- testbench/
|   |-- testbench.v          # Testbench for simulation and verification

## Screenshots

Here are some screenshots from the project:

1. **Processor Design in Vivado**

   ![Processor Design](image.png)