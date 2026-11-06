# RTL tree

The RTL tree is intentionally skeletal until board bring-up and ABI decisions are frozen.

- `cpu/` native RV32 soft CPU or reference wrapper.
- `soc/` bus, IRQ, timer, DMA, DDR-facing logic.
- `gpu/` scanout, planes, compositor and optional blitter.
- `legacy/` Z80/MSX/V9968 compatibility island.

Vendor-specific primitives should live under platform-specific wrappers rather than leaking through the architecture.
