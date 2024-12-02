# Particle-Swarm-Optimization-and-FM-FM-1-WV-Retrial-1-Queues-with-Catastrophes

## Introduction
This repository contains optimizing cost efficiency in cloud storage systems by applying particle swarm optimization of the Markovian retrial queueing model using MATLAB.
## Overview
- **Goal:** Improve k-means clustering using AHA for better centroid initialization.
- **Dataset:** Synthetic dataset (`sample.mat`) with 5 columns.
- **Key Features:**
  - Automatic centroid initialization.
  - Improved convergence speed.
  - Better clustering performance.

---

## Instructions

### 1. Run the Code:
1. Load `sample.mat`.
2. Run `main.m` in MATLAB.

### 2. Dataset:
- **Input file:** `sample.mat` (a synthetic dataset with 5 columns).

### 3. Parameters:
- `MaxIt = 200`: Maximum iterations.
- `nPop = 30`: Population size.

---

## Results

Results are saved as Excel files:
- **`AHA_main.xlsx`:** Main results including costs and intra/inter distances.
- **`AHA_convergence.xlsx`:** Records best fitness over iterations.
- **`AHA_cluster_CentreX.xlsx`:** Final cluster centers.

---

## Requirements

### MATLAB Version:
- **MATLAB R2020b** or later is recommended.

### Toolboxes Required:
- **Statistics and Machine Learning Toolbox**:
  - Functions like `pdist2` and normalization utilities.
- **Excel file I/O**:
  - For saving results as `.xlsx` files.

---
