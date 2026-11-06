# Tang Console 138K target

Reference target for MSX-NG v0.1.

## Planned use

- GW5AST-138 FPGA fabric for the entire mandatory MSX-NG machine.
- 1 GB onboard DDR3 as main memory.
- HDMI for display.
- microSD for root filesystem and images.
- UART/JTAG for first bring-up.
- USB/input added after Linux graphics is stable.

## Do not assume

- B vs C silicon revision;
- flash size/revision;
- exact DDR IP without recording its source/version;
- that a warm reset is equivalent to cold DDR calibration.

See [bring-up plan](../../docs/09-tang138-bringup.md).
