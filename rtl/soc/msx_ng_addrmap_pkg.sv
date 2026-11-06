package msx_ng_addrmap_pkg;
  localparam logic [31:0] BOOT_ROM_BASE = 32'h0000_0000;
  localparam logic [31:0] SOC_BASE      = 32'h1000_0000;
  localparam logic [31:0] GPU_BASE      = 32'h1100_0000;
  localparam logic [31:0] LEGACY_BASE   = 32'h1200_0000;
  localparam logic [31:0] AUDIO_BASE    = 32'h1300_0000;
  localparam logic [31:0] IO_BASE       = 32'h1400_0000;
  localparam logic [31:0] EXP_BASE      = 32'h2000_0000;
  localparam logic [31:0] DDR_BASE      = 32'h8000_0000;
endpackage
