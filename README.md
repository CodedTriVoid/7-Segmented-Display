

# 7-Segment Display Controller (Vivado)

## Overview
This project implements a **multi-digit 7-segment display controller** in **Xilinx Vivado**, designed to demonstrate clean RTL structure, dataflow-oriented design, and practical digital design skills expected at a **junior FPGA / digital design level**.

The design focuses on **selection logic, modular reuse, and clear signal flow**, rather than board-specific tricks. It is written to be readable, synthesizable, and easy to reason about during code reviews or interviews.


::contentReference[oaicite:0]{index=0}


---

## Key Design Concepts Demonstrated

### 1. Dataflow-Driven Control Logic
- A **dataflow module generates a control flag (`z`)**
- This flag acts as a **global select signal** for multiple 2-to-1 multiplexers
- Enables clean and deterministic switching between display data paths

### 2. Comparator-Based Selection
- A dedicated **comparator module** determines when the select flag (`z`) should toggle
- Separates **decision logic** from **data routing**
- Improves readability, testability, and scalability

### 3. Modular Multiplexer Architecture
- Multiple reusable **2-to-1 MUX modules**
- Each MUX handles a portion of the digit or segment selection
- Demonstrates structural RTL composition using simple, well-defined blocks

### 4. Multi-Digit Display Support
- Designed to support **multi-digit outputs** using shared logic
- Output paths can be extended for additional digits without redesigning control logic
- Suitable for time-multiplexed or digit-select based display systems

---

## RTL Architecture (High-Level)
![RTL view of the top module](docs/Top_level_view.png)


**What this shows to a reviewer:**
- Clear separation of concerns  
- Control vs datapath awareness  
- Understanding of scalable RTL design  

---

## Modules Included

| Module | Purpose |
|------|--------|
| `mux_2to1` | Reusable 2-to-1 multiplexer |
| `comparator_dataflow` | Generates select condition |
| `dataflow_seg` | Prepares segment control inputs |
| `bcdto7segment_dataflow` | Converts BCD to 7-segment encoding |
| `top_level` | Structural integration of all blocks |

---

## Why This Project Matters (Recruiter-Focused)

This project demonstrates:

- ✔ RTL-level thinking (not just behavioral code)
- ✔ Comfort with **Vivado RTL analysis and schematic inspection**
- ✔ Clean modular design suitable for **team environments**
- ✔ Understanding of **mux-based data routing**
- ✔ Practical display interfacing logic often used in labs and industry prototypes

It reflects readiness for:
- **Junior FPGA Engineer**
- **Digital Design Engineer (Entry-Level)**
- **Hardware Verification / RTL Development Roles**

---

## Tools & Environment
- **Vivado** (RTL design, simulation, synthesis)
- **Verilog HDL**
- Target-agnostic (no board-specific constraints required)

---

## Possible Extensions
- Add clock-driven digit multiplexing
- Parameterize digit count
- Introduce testbench with waveform validation
- Add timing constraints and synthesis reports

---

## Author
Designed and implemented as part of a growing FPGA portfolio focused on **industry-ready RTL design practices**.

---

> *This repository prioritizes clarity, correctness, and architectural reasoning — the same qualities expected in professional FPGA development.*