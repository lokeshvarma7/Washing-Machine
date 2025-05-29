# 🧼 Washing Machine Controller – Verilog FSM

This project implements a **Finite State Machine (FSM)** based **Washing Machine Controller** using Verilog HDL. The controller simulates a simple real-world washing machine process with distinct stages: **Washing**, **Rinsing**, and **Spinning**, along with error handling and completion indication.

## 🔧 Features

- FSM with 4 states: `IDLE`, `WASH`, `RINSE`, `SPIN`
- Starts only if clothes, detergent liquid, and water tap are all detected
- 30 clock-cycle duration for each stage
- Error detection if water tap is not available
- Finish signal when all operations are completed

## 🧩 Module Interface

### 🔌 Inputs
| Signal       | Width | Description                          |
|--------------|-------|--------------------------------------|
| `clk`        | 1 bit | System clock                         |
| `rst`        | 1 bit | Asynchronous reset                   |
| `clothes`    | 1 bit | Input to detect clothes present      |
| `det_liquid` | 1 bit | Input to detect detergent            |
| `water_tap`  | 1 bit | Input to detect water supply         |

### 💡 Outputs
| Signal   | Width | Description                            |
|----------|-------|----------------------------------------|
| `finish` | 1 bit | High when all operations are done      |
| `error`  | 1 bit | High when water tap is not connected   |

## 🚦 State Diagram (Logical Flow)

  +------+
  | IDLE |<----------------------+
  +--+---+                       |
     |                          |
     v                          |
  +--+---+        Water Tap     |
  | WASH |--------------------->|
  +--+---+                       |
     |                          |
     v                          |
  +--+----+                     |
  | RINSE |                     |
  +--+----+                     |
     |                          |
     v                          |
  +--+---+                      |
  | SPIN |                      |
  +--+---+                      |
     |                          |
     v                          |
 Finish=1, back to IDLE -------+
