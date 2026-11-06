# 08 - Resource budget

## Important warning

These are **planning ranges**, not post-place-and-route measurements. GOWIN LUT4 and Xilinx LUT6 counts are not directly equivalent.

## Base profile estimate

| Functional block | LUT planning range |
|---|---:|
| RV32 native CPU, MMU, L1 | 6-10K |
| IRQ/timers/DMA/interconnect | 4-8K |
| DDR/board wrapper | 3-6K |
| Z80 + MSX bus | 2-4K |
| V9968 | 10-18K |
| native 2D GPU + compositor | 8-16K |
| HDMI/scanout/scaler | 3-6K |
| SD/UART/GPIO/input glue | 3-6K |
| basic audio | 2-4K |
| debug/boot/reserve | 4-8K |
| **Total planning envelope** | **45-86K** |

The large envelope reflects uncertainty around the final V9968 integration, GPU feature set and SoC fabric.

## Target interpretation

### GW5AST/GW5AT-138

138,240 LUT4. Comfortable for v0.1, with room for:

- second native core;
- larger caches;
- more audio;
- 3D experiment;
- expansion fabric.

### GW5A/GW5AT-60

59,904 LUT4. Base profile is possible only if the design lands toward the low/middle end. v0.1 should therefore use the 138K as the reference and later produce an **NG-Base** cut-down configuration.

### XC7Z020 PL

53,200 Xilinx LUT6. Not numerically comparable 1:1 with LUT4. A compact port is plausible, especially because 7-series LUT6 primitives are more expressive, but it must be measured with Vivado rather than inferred from GOWIN percentages.

## BSRAM planning

138K provides 6,120 Kbit BSRAM (~765 KiB). Suggested first budget:

- CPU I-cache 16 KiB;
- CPU D-cache 16 KiB;
- TLBs/metadata 8-16 KiB;
- boot ROM 32-64 KiB;
- GPU line/FIFO buffers 64-128 KiB;
- V9968/local FIFOs 32-64 KiB;
- DMA/debug buffers 32-64 KiB;
- keep the remainder as timing/resource margin.

Main memory remains external DDR3.

## First synthesis gates

Do not proceed to the next major feature if:

- LUT utilization exceeds 75% before the legacy island is integrated;
- BSRAM exceeds 70% before graphics and caches are final;
- timing closure depends on one lucky placement seed;
- DDR calibration is not repeatable over cold boots.
