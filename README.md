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

## Mathematical Background

The governing equation for **1D transient heat conduction** is:

\[
\rho c \frac{\partial T}{\partial t} = \lambda \frac{\partial^2 T}{\partial x^2}, \quad 0 < x < L, \; 0 < t < T
\]

where  
- \( T(x,t) \): temperature  
- \( \rho \): density  
- \( c \): specific heat capacity  
- \( \lambda \): thermal conductivity  

### Weak Formulation
By multiplying with a test function \( v \) and integrating over the domain:

\[
\int_{0}^{L} \rho c \, v \, \frac{\partial T}{\partial t} \, dx 
+ \int_{0}^{L} \lambda \, \frac{\partial v}{\partial x} \, \frac{\partial T}{\partial x} \, dx 
= \left[ \lambda v \frac{\partial T}{\partial x} \right]_{0}^{L}
\]

### Time Discretization
The **θ-method** is applied for temporal integration:

\[
C \frac{T^{n+1} - T^n}{\Delta t} + \theta K T^{n+1} + (1-\theta) K T^n = 0
\]

with \( \theta = \tfrac{2}{3} \) (unconditionally stable).  

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
