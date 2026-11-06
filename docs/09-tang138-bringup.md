# 09 - Tang Console 138K bring-up

## Known board facts relevant to MSX-NG

The current Tang Mega/Console 138K family uses GW5AST-138 and provides 1 GB DDR3 on the SOM. Existing MSXimus_138 work also documents the 138K PLL, DDR3 and package differences in practical detail.

**Before compiling anything:** identify whether the physical FPGA is device version **B or C** and select the matching GOWIN device version. Do not assume.

## Phase 0 - freeze the development environment

Record in `boards/tang-console-138k/BUILD_ENV.md`:

- exact board revision;
- FPGA marking and B/C device version;
- GOWIN IDE/programmer version;
- operating system;
- programmer cable/path;
- flash size;
- known-good constraint file source;
- DDR3 IP version/checksum.

### Acceptance

A minimal bitstream toggles LED/GPIO and produces UART output reliably after 20 cold boots.

## Phase 1 - clocks and DDR

Reuse known-good 138K PLL/DDR techniques from MSXimus_138 where licensing permits, but isolate them behind `rtl/platform/gowin138/` wrappers.

Test:

- PLL lock;
- DDR calibration;
- walking ones/zeros;
- address test;
- pseudo-random full-range test;
- repeated cold boot calibration.

### Acceptance

Zero memory errors in an extended test and successful calibration on every cold boot in the test set.

## Phase 2 - SoC skeleton

Implement:

- BRAM ROM;
- UART;
- timer;
- interrupt controller;
- DDR bridge;
- minimal CSR/MMIO map.

No GPU. No MSX.

### Acceptance

A soft CPU runs a bare-metal memory test from ROM/DDR and services timer/UART interrupts.

## Phase 3 - Linux CPU reference

Use a known-good RV32 Linux core first. Target 50-75 MHz, not maximum frequency.

### Acceptance

- M/S/U modes validated;
- Sv32 page translation works;
- OpenSBI starts;
- Linux reaches early console;
- Linux sees the expected DDR size.

## Phase 4 - Buildroot

Start with initramfs, then SD rootfs.

### Acceptance

Shell prompt, `free`, `mount`, `/proc`, `/sys`, timer and UART are stable.

## Phase 5 - HDMI framebuffer

Reuse/port known-good 720p HDMI timing.

### Acceptance

Linux writes a framebuffer in DDR and a deterministic test pattern is displayed without tearing/corruption.

## Phase 6 - DRM/KMS / GUI

Create the MSX-NG DRM driver and expose primary + cursor planes first.

### Acceptance

A Wayland/Weston session or minimal compositor opens at least two graphical native applications.

## Phase 7 - legacy island

Integrate Z80 + V9968 behind the host bridge.

### Acceptance

MSX BIOS boots and a known V9968/MSX workload runs while Linux stays alive.

## Phase 8 - legacy plane/window

Route V9968 output into the native compositor.

### Acceptance

MSX image can switch among:

- hidden;
- windowed;
- scaled;
- fullscreen;

without resetting the legacy core.

## Phase 9 - storage/input/audio

Integrate SD and usable input. Add basic audio before advanced OPL4/MoonSound.

## Phase 10 - SMP

Only after single-core Linux + graphics + legacy are stable.

### Acceptance

Two harts visible to Linux; stress test passes; DMA/graphics does not corrupt memory.
