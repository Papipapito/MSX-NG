# 14 - Architecture decision log

## ADR-001 - Linux is the native OS baseline

**Decision:** Buildroot-generated Linux is the reference operating system.

**Reason:** avoids writing filesystems/network/USB/process management from scratch.

## ADR-002 - native CPU is soft logic

**Decision:** MSX-NG does not require the GW5AST hard RISC-V or Zynq ARM.

**Reason:** portability and the project goal of defining an FPGA-native machine.

## ADR-003 - Z80/V9968 remain hardware

**Decision:** legacy compatibility uses dedicated RTL, not Linux software emulation.

**Reason:** timing/compatibility and architectural identity.

## ADR-004 - 2D first, 3D optional

**Decision:** base graphics require KMS planes/compositor, not RasterIX.

**Reason:** fit 60K-class targets and accelerate Linux GUI bring-up.

## ADR-005 - one 138K first

**Decision:** prove the complete v0.1 system in one 138K before splitting across FPGAs.

**Reason:** simplifies debug and proves resource assumptions.

## ADR-006 - known-good CPU before custom CPU

**Decision:** Linux platform bring-up may use VexRiscv/VexRiscv-SMP as a temporary reference implementation.

**Reason:** separates platform debugging from new CPU microarchitecture debugging.

## ADR-007 - hard RISC-V is optional out-of-band companion

**Decision:** hard processor use is allowed only as an optional board service.

**Reason:** preserve portability and make failure/recovery paths stronger.
