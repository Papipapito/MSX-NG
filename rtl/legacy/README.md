# Legacy MSX RTL

The legacy block contains Z80 + MSX bus + V9968 and presents a host bridge to Linux/native hardware.

Do not directly couple Linux drivers to internal Z80/VDP signals. Maintain a clean control/status/DMA boundary.
