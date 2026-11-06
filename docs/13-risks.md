# 13 - Risks and open questions

## High priority

### Linux CPU complexity

A custom Linux-capable CPU with MMU and correct privilege behavior is significantly more work than a bare-metal RISC-V. Mitigation: bring Linux up first on a known-good reference core, then replace the CPU behind the same SoC interfaces.

### DDR determinism / calibration

DDR3 is the foundation for Linux and graphics. Mitigation: standalone memory-test image before any OS work; repeated cold-boot testing.

### 60K fit

The 60K target is a portability goal, not the first development target. Do not compromise the 138K reference architecture prematurely.

### Graphics driver scope

A full Mesa/OpenGL driver would consume project time. Mitigation: KMS/planes + software rendering + 2D compositor first.

### RV32 application ecosystem

Linux runs on RV32, but mainstream desktop binary distributions focus far more on RV64. Mitigation: Buildroot, source-built packages, and an optional future RV64 profile if the hardware budget supports it.

### V9968 licensing/integration

Before copying any external RTL into MSX-NG, verify license compatibility and keep provenance documented.

## Open design questions

- final native CPU implementation after VexRiscv reference bring-up;
- interrupt controller architecture (PLIC-compatible vs custom simple controller);
- AXI vs Wishbone as internal standard bus;
- exact V9968 framebuffer capture method;
- shared DDR arbitration policy;
- audio baseline vs optional expansion;
- whether the final desktop uses Weston or a custom compositor;
- external expansion physical connector standard;
- whether 1080p is mandatory for v1.0 or optional.
