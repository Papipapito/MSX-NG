# 06 - Legacy MSX subsystem

## Goal

Run MSX software on dedicated hardware logic while Linux remains the host environment.

## v0.1 blocks

- Z80-compatible core.
- MSX memory/slot fabric sufficient to boot BIOS.
- V9968-class VDP.
- BIOS/ROM storage interface.
- keyboard/joystick bridge.
- PSG/basic audio initially.
- control/status mailbox visible to Linux.

## Host control registers - draft

| Offset | Name | Function |
|---:|---|---|
| `0x0000` | `LEGACY_CTRL` | reset/run/pause/fullscreen request |
| `0x0004` | `LEGACY_STATUS` | running/halted/vblank/error |
| `0x0008` | `LEGACY_IRQ` | interrupt status/ack |
| `0x0010` | `ROM_BASE` | DDR pointer for mounted ROM |
| `0x0014` | `DISK_BASE` | descriptor pointer for disk image |
| `0x0020` | `VIDEO_BASE` | legacy framebuffer/plane address |
| `0x0024` | `VIDEO_MODE` | dimensions/pixel mode |
| `0x0030` | `INPUT_FIFO` | host-to-MSX key/input events |

This is intentionally a draft until the first integration test.

## Reuse strategy

MSXimus_138 is a valuable reference for:

- V9968 timing;
- 138K PLL strategy;
- DDR3 IP integration;
- HDMI timing;
- SD and input experience;
- resource/timing closure lessons.

MSX-NG should avoid simply embedding the entire MSXimus top level. The legacy island needs a cleaner host-facing boundary so it can operate as a Linux-managed subsystem.

## First compatibility milestone

1. boot BIOS;
2. BASIC prompt;
3. V9968 DEVCON/demo;
4. ROM boot;
5. one timing-sensitive game/demo;
6. window/fullscreen switching with no legacy reset.
