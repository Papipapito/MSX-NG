# Contributing

MSX-NG is specification-first.

Before changing an ABI-visible register, memory map, device-tree binding or CPU requirement:

1. update the relevant document;
2. add/update an ADR in `docs/14-decisions.md`;
3. state backward-compatibility impact;
4. include synthesis/timing evidence for RTL changes where applicable.

Do not copy third-party RTL until its license and provenance are documented.
