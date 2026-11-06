# Buildroot plan

Reference userspace: Buildroot-generated RV32 Linux system.

## First image

- RV32 toolchain;
- musl;
- BusyBox;
- initramfs;
- serial console;
- `dropbear` optional after network exists.

## Graphics image

Add:

- libdrm;
- Wayland;
- Weston or a minimal custom compositor;
- SDL2;
- terminal;
- one lightweight native demo/application.

## Reproducibility

Pin Buildroot, Linux and OpenSBI commits in a future `versions.mk`/manifest once the first known-good boot exists. Do not track arbitrary latest versions in release builds.
