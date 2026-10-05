# Elevator Controller FSM

## 📌 Project Overview

This project implements a simple **3-floor Elevator Controller** using **Verilog HDL** and a **Finite State Machine (FSM)**.

The elevator starts at **Floor 1** after reset and can receive requests for Floor 1, Floor 2, or Floor 3.

The elevator moves **one floor per clock cycle** toward the requested destination.

The controller generates three outputs:

- `up` — elevator is moving upward
- `down` — elevator is moving downward
- `at_floor` — elevator has reached the requested floor

---

## 🎯 Objective

To design and verify a simple elevator controller using a Verilog FSM that can:

- Track the current floor
- Accept floor requests
- Move one floor at a time
- Indicate upward movement
- Indicate downward movement
- Indicate when the requested floor is reached

---

## ⚙️ Specifications

| Parameter | Description |
|-----------|-------------|
| Number of Floors | 3 |
| Starting Floor | Floor 1 |
| Inputs | `clk`, `reset`, `floor1`, `floor2`, `floor3` |
| Outputs | `up`, `down`, `at_floor` |
| Clock | Positive-edge triggered |
| Reset | Asynchronous active-high |
| Movement | One floor per clock cycle |

---

## 🔌 Inputs and Outputs

### Inputs

| Signal | Description |
|--------|-------------|
| `clk` | Clock signal |
| `reset` | Resets the elevator to Floor 1 |
| `floor1` | Request to go to Floor 1 |
| `floor2` | Request to go to Floor 2 |
| `floor3` | Request to go to Floor 3 |

### Outputs

| Signal | Description |
|--------|-------------|
| `up` | Indicates upward movement |
| `down` | Indicates downward movement |
| `at_floor` | Indicates that the elevator is at the requested floor |

---

## 🧠 FSM States

The current floor is represented using three FSM states.

| State | Encoding | Meaning |
|-------|----------|---------|
| `F1` | `2'b00` | Floor 1 |
| `F2` | `2'b01` | Floor 2 |
| `F3` | `2'b10` | Floor 3 |

### State Declaration

```verilog
localparam f1 = 2'b00,
           f2 = 2'b01,
           f3 = 2'b10;

 🔄 State Transition Table
Current State	Request	Next State
F1	Floor 1	F1
F1	Floor 2	F2
F1	Floor 3	F2
F2	Floor 1	F1
F2	Floor 2	F2
F2	Floor 3	F3
F3	Floor 1	F2
F3	Floor 2	F2
F3	Floor 3	F3


The elevator moves one floor at a time rather than directly jumping to the requested destination.

🧪 Verification
A Verilog testbench was developed to verify the elevator controller.
The testbench verifies:
- Reset operation
- Floor 1 → Floor 2
- Floor 2 → Floor 3
- Floor 3 → Floor 1
- Floor 1 → Floor 2
- Up movement
- Down movement
- Requested floor detection
Waveform simulation was performed to verify the FSM transitions and output signals.

📊 Test Sequence
The testbench performs the following sequence:
Reset
 ↓
Floor 1
 ↓
Request Floor 2
 ↓
Floor 2
 ↓
Request Floor 3
 ↓
Floor 3
 ↓
Request Floor 1
 ↓
Floor 2
 ↓
Floor 1
 ↓
Request Floor 2
 ↓
Floor 2

🛠️ Tools Used
- Verilog HDL
- EDA Playground
- Icarus Verilog
- GTKWave
- Git
- GitHub
📁 Project Files
Elevator/
│
├── elevator.v
├── tb.v
└── README.md

🎓 Learning Outcomes
- Understanding FSM-based controller design
- Designing multi-state controllers
- State encoding
- State register implementation
- Next-state logic
- Combinational output logic
- Floor request handling
- Direction control
- Verilog testbench development
- Waveform-based verification
- Git and GitHub project management
👨‍💻 Author
Ravi Kumar
B.Tech – Electronics and Communication Engineering
Interested in RTL Design and Design Verification