# 01 - Vision and principles

## What MSX-NG is

MSX-NG is a **new computer architecture inspired by MSX but not constrained to the Z80 era**. It preserves legacy compatibility using dedicated FPGA hardware and adds a modern native execution environment.

The project has two personalities:

- **Native machine:** RV32 soft CPU, Linux, modern memory model, native graphics, modern storage/network/input.
- **Legacy machine:** Z80 + MSX bus + V9968-class VDP, presented to the native system as a controllable hardware subsystem.

## Non-goals for the first version

- replacing Linux with a custom kernel;
- complete OpenGL/Vulkan support;
- running Chromium-class desktop software;
- requiring the GW5AST hard RISC-V;
- requiring a second FPGA;
- inventing a new compiler/toolchain when RISC-V already provides one.

## Why Linux

Linux supplies the expensive generic parts: process isolation, filesystems, TCP/IP, USB stacks, drivers, multitasking and standard APIs. That lets the project focus engineering effort on the FPGA CPU, graphics, MSX compatibility and hardware/software interfaces.

## Why the MSX is hardware, not a software emulator

Keeping Z80 + VDP in hardware preserves timing and compatibility and creates a differentiating architecture. Linux controls the subsystem, but does not have to emulate every Z80 instruction or VDP quirk in software.

## Portability rule

The mandatory implementation must run with all hard application processors disabled/unassigned. Vendor-specific blocks are allowed only behind wrappers for clocks, DDR, SERDES, HDMI I/O and other physical resources.
