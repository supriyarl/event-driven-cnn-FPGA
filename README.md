# event-driven-cnn-FPGA

# Event-Driven Sparse CNN Accelerator on Zynq FPGA

## Overview
This project presents an event-driven, sparse CNN accelerator implemented on a Xilinx Zynq SoC. 
The design leverages FPGA fabric for compute-intensive convolution operations while using the Arm processor for control, data movement, and post-processing.

Unlike conventional dense CNN accelerators, this work introduces an **event-driven execution model** that processes only non-zero activations, significantly reducing redundant computation, memory accesses, and power consumption.


---

## Key Contributions
- RTL-based CNN accelerator (HLS-free)
- Event-driven sparse execution model
- Arm–FPGA hardware/software co-design
- Quantitative comparison with CPU-only CNN execution

---

## System Architecture
- **Arm Processor (PS)**
  - Image capture and preprocessing
  - Accelerator configuration via AXI-Lite
  - Post-processing and result handling

- **FPGA Fabric (PL)**
  - Event-driven CNN accelerator
  - Sparse convolution execution
  - On-chip buffering and pooling

---

## Performance Improvements

### 1. Latency Reduction
- Zero activations are filtered at the hardware boundary
- Fewer MAC operations and memory writes
- Reduced pipeline stalls

**Result:** Lower end-to-end inference latency

---

### 2. Throughput Improvement
- Event-driven execution avoids dense sliding window evaluation
- MAC units are active only on meaningful data
- Better utilization of compute resources

**Result:** Higher effective inferences per second

---

### 3. Power Efficiency
- Reduced switching activity in MAC array
- Fewer BRAM accesses
- Event-based control minimizes unnecessary toggling

**Result:** Lower dynamic power consumption

---

### 4. FPGA Resource Efficiency
- Smaller FIFO depth due to sparse data
- Reduced DSP usage for zero-valued operations
- Efficient BRAM utilization

**Result:** Improved LUT, BRAM, and DSP efficiency

---

## Comparison Summary

| Metric | CPU-only CNN | Baseline FPGA CNN | Event-Driven FPGA CNN |
|------|-------------|------------------|----------------------|
| Latency | High | Medium | **Low** |
| Throughput | Low | Medium | **High** |
| Power | High | Medium | **Low** |
| Resource Efficiency | N/A | Medium | **High** |

---

## Tools and Platform
- Xilinx Zynq / Kria Platform
- RTL (SystemVerilog)
- Vivado
- ARM Cortex-A (bare-metal / Linux)
- OpenCV (optional)

---


