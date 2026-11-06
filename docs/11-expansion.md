# 11 - Expansion and multi-FPGA strategy

## First rule

Do not make multi-FPGA communication a v0.1 dependency. Prove the complete concept in one 138K first.

## Future split

A natural later partition is:

```text
FPGA A - CPU/system              FPGA B - video
RV32 SMP                         native 2D/3D
DDR/system fabric  <SERDES>      V9968 / compositor / HDMI
```

For 138K-to-138K, use dedicated SERDES/RoraLink-class links.

## 25K expansion modules

25K-class modules are appropriate for audio, I/O, network offload and custom hardware. They do not need the same bandwidth as the video FPGA.

Preferred expansion connector philosophy:

- 40-50 physical contacts;
- generous ground/power allocation;
- a small number of high-speed differential or source-synchronous signals;
- IRQ/reset/presence;
- optional GPIO/JTAG;
- packetized/memory-mapped logical protocol rather than exposing a giant raw parallel bus.

## Compatibility requirement

The logical expansion ABI should remain independent of the exact physical transport so a future implementation can map it onto:

- LVDS;
- parallel source-synchronous bus;
- SERDES;
- simulation transport.
