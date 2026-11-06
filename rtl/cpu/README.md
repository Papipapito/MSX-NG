# CPU RTL

## First implementation

Integrate a known-good Linux-capable RV32 core to validate the platform.

## Long-term

Replace it with the MSX-NG native CPU while keeping:

- RV32IMAC software contract;
- M/S/U;
- Sv32;
- interrupt model;
- bus master interface;
- debug hooks.

The optional dual Z80/RV32 decode concept belongs after v0.1 platform validation.
