# 12 - Suggestions: hard RISC-V companion on GW5AST-138

This processor is **not part of the MSX-NG standard**. The machine must remain portable to devices with no hard CPU.

## Strongest complementary uses

### 1. Board management controller (BMC)

Keep it alive independently from the soft CPU:

- fan/temperature control;
- watchdog;
- reset reasons;
- clock/PLL status;
- DDR calibration diagnostics;
- power-state control where available.

### 2. Recovery and updater

Give it a small recovery firmware that can:

- verify bitstreams;
- maintain A/B FPGA images;
- restore a known-good image;
- update Linux rootfs/boot files;
- expose a recovery console.

### 3. Out-of-band debugger

The hard CPU could inspect memory-mapped debug registers while the native soft CPU is stopped:

- halt/reset harts;
- read trace FIFOs;
- dump crash memory;
- collect performance counters;
- capture legacy MSX state.

### 4. Remote management

If connected to networking through board peripherals or a companion network device:

- web UI;
- SSH-like maintenance channel;
- serial-over-network;
- telemetry;
- remote power/reset/update.

### 5. Storage/image service

Background jobs that should not perturb the soft CPU:

- ROM/DSK indexing;
- checksum/database maintenance;
- download/update staging;
- decompression;
- asset prefetch.

### 6. FPGA lab assistant

During development it can become a test supervisor:

- automated memory tests;
- core reset sequencing;
- reproducible test vectors;
- manufacturing diagnostics;
- telemetry logging across PnR seeds/bitstreams.

## Architectural rule

No normal MSX-NG application may require this processor. Communication must go through a documented optional service interface so the same software can run on 60K/Z020 targets without it.
