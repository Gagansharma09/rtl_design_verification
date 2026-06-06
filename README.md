# RTL Design & Verification

Structured practice repository covering digital design from RTL to functional
verification using SystemVerilog and UVM.

**Tools:** EDA Playground · Questa / Riviera-PRO  
**Language:** SystemVerilog (IEEE 1800-2017) · UVM 1.2  
**Hardware:** Cora Z7 (Zynq-7000 · xc7z007sclg400-1) · Vivado 2023.2

---

## Methodology

Every module in this repository follows a fixed progression:
RTL Design → Simulation → Assertions → Constrained Random → Functional Coverage → UVM
### 1. RTL Design
- Synthesizable SystemVerilog only
- Explicit `always_ff`, `always_comb`, `always_latch`
- No `initial` blocks in RTL
- Clean port declarations with direction and type

### 2. Simulation
- Self-checking testbench — pass/fail to console, no manual waveform reading
- Corner cases covered explicitly
- `$error` on any mismatch

### 3. Assertions (SVA)
- Immediate assertions in RTL for sanity checks
- Concurrent assertions in TB for protocol checking
- Cover properties for reachability

### 4. Constrained Random Verification
- `rand` and `randc` stimulus generation
- `constraint` blocks for meaningful input space
- Repeat runs with different seeds

### 5. Functional Coverage
- `covergroup` and `coverpoint` per DUT
- Cross coverage for interaction between signals
- Coverage closure before sign-off

### 6. UVM Environment
- Full UVM hierarchy: sequence item → sequence → driver
  → monitor → scoreboard → agent → env → test
- Reusable agent per protocol
- Multiple test classes per DUT

---

## Repository Structure

---

## Modules Covered

**Sequential Fundamentals**  
D Flip-Flop · DFF variants (reset, enable, async) · D Latch · Edge detection · Shift registers · LFSRs

**Counters**  
Binary · Decade · BCD · 12-hour clock · Parameterized counter

**Finite State Machines**  
Moore · Mealy · One-hot encoding · Sequence detectors · Serial receiver · PS/2 parser

**Communication Protocols**  
UART TX/RX · FIFO (sync and async)

**Larger Systems**  
FSM + Datapath · Complete timer · Sequence recognizer

---

## Verification Skills Demonstrated

- SystemVerilog Assertions (SVA) — immediate and concurrent
- Constrained random stimulus generation
- Functional coverage closure
- UVM component reuse across DUTs
- Bug hunting from waveforms and simulation logs

---
