# 1D Transient Heat Conduction Simulation

This repository contains a MATLAB implementation of a **1D transient heat conduction problem** using the **finite element method (FEM)**.  
The script computes the temperature distribution along a rod over time, given material properties, boundary conditions, and discretization parameters.  

---

## Features
- Finite Element Method (FEM) formulation for 1D heat conduction  
- Considers conduction, density, and heat capacity  
- Supports customizable:
  - Number of elements (`noe`) and timesteps (`not`)  
  - Rod length (`L`) and simulation time (`T`)  
  - Material properties (`λ`, `ρ`, `c`)  
  - Boundary conditions (`inTemp`, `outTemp`)  
- Saves temperature evolution at all timesteps in a `.mat` file  
- Visualizes nodal temperatures along the rod at each timestep  

---

## How It Works
1. Discretizes the rod into elements and sets up global **stiffness** and **capacity** matrices.  
2. Applies **Dirichlet boundary conditions** at both ends.  
3. Time integration is performed using the **θ-method** (`θ = 2/3`).  
4. Results are stored in `allData` and exported as `A_matrix_3.mat`.  
5. Temperature profiles are plotted dynamically.  

---

## Requirements
- MATLAB (R2020a or newer recommended)  
- FEM toolbox functions:
  - `assem.m` (matrix assembly)  
  - `solveq.m` (system solver)  

---

## Usage
1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/your-repo.git
   cd your-repo
