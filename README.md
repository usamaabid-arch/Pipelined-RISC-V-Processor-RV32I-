# Pipelined RISC-V Processor (RV32I)

## Overview
This repository contains the RTL implementation of a 32-bit Pipelined RISC-V Processor based on the RV32I base integer instruction set. The design encompasses a datapath partitioned into fetch, decode, execute, and write-back stages, utilizing dedicated pipeline registers to manage instruction flow and control signals.

## Supported Instruction Set
The processor's control path decodes and executes the following instruction formats based on the primary 7-bit opcode:
* **R-Type:** Standard arithmetic and logical operations (`add`, `sub`).
* **I-Type:** Immediate arithmetic operations and Data Load (`lw`).
* **S-Type:** Data Store (`sw`).
* **B-Type:** Branch Equal (`beq`).

## Architecture Highlights
The processor is structurally modeled using interconnected sub-modules:
* **Pipeline Registers:** Dedicated `Reg_IF`, `Reg_ID`, `Reg_EX`, and `Reg_WB` modules isolate stage logic and propagate localized datapath and control signals.
* **Instruction Memory:** A parameterized ROM containing hardcoded machine code arrays for test execution.
* **Register File:** A memory array that explicitly prevents data writes to the zero register (`x0`) by verifying the destination address (`Imm_reg_write[11:7] != 5'd0`).
* **Immediate Generator:** Extracts and correctly sign-extends immediate values across I, S, B, U, and J instruction formats.
* **Data Memory:** A parameterized synchronous memory block that executes writes on the negative clock edge and reads data combinationally.
* **Top-Level Integration:** The `top` module routes all datapath multiplexers, ALUs, and adders, utilizing a dedicated AND-gate for branching logic.

## Module Interface (Top-Level)
| Port | Direction | Size | Description |
| :--- | :--- | :--- | :--- |
| `clk` | Input | 1-bit | System clock|
| `reset` | Input | 1-bit | Asynchronous active-high reset |

## Configurable Parameters
The `top` module includes overrideable parameters to scale the architecture:
* `N`: Datapath bit-width (Default: 32)
* `D`: Depth sizing for memory elements (Default: 32)
* `width`: Register file width (Default: 32)
