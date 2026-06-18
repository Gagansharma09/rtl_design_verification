# RTL Design & Verification — HDLBits Practice

Structured SystemVerilog practice covering every problem in the HDLBits
Arithmetic, K-map, Sequential Logic, FSM, Verification, and Testbench sections.

## Repository Structure

```
rtl_design_verification/
├── arithmetic/              # Arithmetic circuits
│   ├── half_adder/
│   ├── full_adder/
│   ├── adder3/
│   ├── adder_m2014_q4j/
│   ├── signed_overflow/
│   ├── adder100/
│   └── bcd_adder4/
├── kmap/                    # Karnaugh map → circuit
│   ├── kmap1_3var/
│   ├── kmap2_4var/  kmap3_4var/  kmap4_4var/
│   ├── sop_pos_ece241_2013_q2/
│   ├── kmap_m2014_q3/  kmap_2012_q1g/
│   └── kmap_mux_ece241_2014_q3/
├── sequential/
│   ├── latches_ff/          # DFF variants, latches, edge detect
│   ├── counters/            # Binary, BCD, decade, 12-hr clock
│   ├── shift_registers/     # Shift regs, LFSRs, rotate
│   ├── cellular_automata/   # Rule 90, Rule 110, Conway Life
│   └── fsm/                 # All FSM problems (Moore, Mealy, one-hot)
├── larger_circuits/         # FSM + datapath integration
└── verification/
    ├── bug_finding/         # Buggy modules + fixed versions + TBs
    ├── waveform/            # Reverse-engineer circuit from waveform
    └── testbenches/         # HDLBits testbench writing section
```

## File Convention

Every problem folder contains exactly two files:

| File | Purpose |
|------|---------|
| `<module_name>.sv` | Synthesizable RTL (your HDLBits answer) |
| `tb_<module_name>.sv` | Self-checking testbench (`$error` on mismatch) |

## Simulation

### EDA Playground (recommended)
1. Paste RTL into the left pane
2. Paste testbench into the right pane
3. Select **ModelSim** or **Riviera-PRO**, language **SystemVerilog**
4. Run simulation

### Questa / ModelSim (local)
```bash
vlog <module>.sv tb_<module>.sv
vsim -c tb_<module> -do "run -all; quit"
```

### Icarus Verilog (free)
```bash
iverilog -g2012 -o sim <module>.sv tb_<module>.sv
vvp sim
```

## Methodology

Each module follows the repo's 6-stage progression:

```
RTL → Simulation → SVA → Constrained Random → Functional Coverage → UVM
```

Currently all modules are at Stage 1 (RTL) and Stage 2 (Simulation).
SVA/CRV/coverage layers will be added iteratively.

## Status

| Section | RTL | TB | Notes |
|---------|-----|----|-------|
| Arithmetic (7) | ✅ | ✅ | Complete |
| K-map (8) | ✅ | ✅ | kmap4 has don't-care handling |
| Latches/FF (18) | ✅ | ✅ | Dual-edge emulated |
| Counters (8) | ✅ | ✅ | BCD + 12-hr clock |
| Shift Registers (9) | ✅ | ✅ | LFSRs verified maximal-length |
| Cellular Automata (3) | ✅ | ✅ | Conway tested with blinker |
| FSMs (34) | ⚠️ | ⚠️ | Core ones done; exam stubs need filling |
| Larger Circuits (7) | ⚠️ | ⚠️ | count1k + seq1101 done |
| Bug Finding (5) | ✅ | ✅ | Buggy + fixed versions |
| Waveform (10) | 🔲 | ✅ | Implement after HDLBits waveform |
| Testbenches (5) | ✅ | ✅ | Clock, tb1, AND, tb2, TFF |

Legend: ✅ complete · ⚠️ partial · 🔲 placeholder
