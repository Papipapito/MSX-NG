# 04 - Memory map

## Physical address map v0.1

| Start | End | Size | Function |
|---|---|---:|---|
| `0x0000_0000` | `0x0000_FFFF` | 64 KiB | boot ROM / BRAM scratch |
| `0x1000_0000` | `0x100F_FFFF` | 1 MiB | SoC control / IRQ / timers |
| `0x1010_0000` | `0x101F_FFFF` | 1 MiB | UART / GPIO / debug |
| `0x1100_0000` | `0x11FF_FFFF` | 16 MiB | GPU/display registers |
| `0x1200_0000` | `0x12FF_FFFF` | 16 MiB | legacy MSX control/window |
| `0x1300_0000` | `0x13FF_FFFF` | 16 MiB | audio |
| `0x1400_0000` | `0x14FF_FFFF` | 16 MiB | SD/storage/board I/O |
| `0x2000_0000` | `0x2FFF_FFFF` | 256 MiB | expansion aperture |
| `0x8000_0000` | `0xBFFF_FFFF` | 1 GiB | DDR3 main memory |

## DDR use

The address map does not statically partition DDR. Linux owns memory and drivers allocate DMA buffers. Suggested planning only:

- kernel/userspace: 256-512 MiB;
- page cache: dynamic;
- native graphics buffers: 64-128 MiB reserve maximum;
- legacy framebuffers/VRAM staging: 8-32 MiB;
- DMA shared pool: 16-64 MiB.

## Framebuffer examples

1920x1080:

- RGB565: ~4.15 MB;
- RGB888: ~6.22 MB;
- XRGB/ARGB8888: ~8.29 MB;
- two XRGB8888 buffers: ~16.6 MB;
- three: ~24.9 MB.

1 GB DDR therefore provides ample space; bandwidth and arbitration matter more than capacity.
