# Vending Machine FSM

## 📌 Project Overview

This project implements a simple vending machine controller using **Verilog HDL** and a **Finite State Machine (FSM)**.

The vending machine dispenses a product costing **₹10**.

The design accepts:

- ₹5 coin
- ₹10 coin

The FSM keeps track of the amount inserted and generates:

- `dispense` — indicates that the product should be dispensed
- `change` — indicates that ₹5 change should be returned

This project is implemented as a **Mealy FSM**, because the outputs depend on both the current state and the input coin.

---

## 🎯 Objective

To design and verify a vending machine controller using a Mealy Finite State Machine in Verilog.

---

## ⚙️ Specifications

| Parameter | Description |
|-----------|-------------|
| Product Price | ₹10 |
| Inputs | `coin5`, `coin10` |
| Outputs | `dispense`, `change` |
| FSM Type | Mealy FSM |
| Clock | Positive-edge triggered |
| Reset | Asynchronous active-high |

---

## 🔌 Inputs and Outputs

### Inputs

| Signal | Description |
|--------|-------------|
| `clk` | Clock signal |
| `reset` | Active-high asynchronous reset |
| `coin5` | Indicates insertion of ₹5 |
| `coin10` | Indicates insertion of ₹10 |

### Outputs

| Signal | Description |
|--------|-------------|
| `dispense` | Product dispensing signal |
| `change` | ₹5 change return signal |

---

## 🧠 FSM States

The vending machine uses two states:

| State | Meaning |
|-------|---------|
| `S0` | ₹0 received |
| `S5` | ₹5 received |

### State Encoding

```verilog
S0 = 1'b0
S5 = 1'b1

🔄 State Transition Table
Current State	coin5	coin10	Next State	dispense	change
S0	0	0	S0	0	0
S0	1	0	S5	0	0
S0	0	1	S0	1	0
S5	0	0	S5	0	0
S5	1	0	S0	1	0
S5	0	1	S0	1	1

🔍 Working Principle
Case 1: Insert ₹5
Initial State: S0
        ↓
      ₹5 coin
        ↓
       S5

The machine waits for another coin.
Case 2: Insert another ₹5
S5 + ₹5
   ↓
S0
   ↓
dispense = 1
change = 0

The total amount becomes ₹10, so the product is dispensed.
Case 3: Insert ₹10 from S0
S0 + ₹10
   ↓
S0
   ↓
dispense = 1
change = 0

The product is immediately dispensed.
Case 4: Insert ₹10 after ₹5
S5 + ₹10
   ↓
S0
   ↓
dispense = 1
change = 1

The total amount is ₹15.
Therefore:
- Product = ₹10
- Change = ₹5

🔍 Working Principle
Case 1: Insert ₹5
Initial State: S0
        ↓
      ₹5 coin
        ↓
       S5

The machine waits for another coin.
Case 2: Insert another ₹5
S5 + ₹5
   ↓
S0
   ↓
dispense = 1
change = 0

The total amount becomes ₹10, so the product is dispensed.
Case 3: Insert ₹10 from S0
S0 + ₹10
   ↓
S0
   ↓
dispense = 1
change = 0

The product is immediately dispensed.
Case 4: Insert ₹10 after ₹5
S5 + ₹10
   ↓
S0
   ↓
dispense = 1
change = 1

The total amount is ₹15.
Therefore:
- Product = ₹10
- Change = ₹5

🛠️ Tools Used
- Verilog HDL
- EDA Playground
- Icarus Verilog / Verilog Simulator
- GTKWave
- Git
- GitHub

🚀 Learning Outcomes
- Understanding Mealy FSM architecture
- Designing state transitions
- Implementing state registers
- Writing combinational next-state logic
- Writing Mealy output logic
- Creating Verilog testbenches
- Verifying FSM behavior using waveforms
- Using Git and GitHub for RTL projects
👨‍💻 Author
Ravi Kumar
B.Tech – Electronics and Communication Engineering
Interested in RTL Design and Design Verification.