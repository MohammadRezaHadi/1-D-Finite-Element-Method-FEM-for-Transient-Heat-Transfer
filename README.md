# 1D Transient Heat Conduction Simulation

MATLAB implementation of a 1D transient heat conduction problem using the finite element method (FEM). The script computes temperature along a rod over time, given material properties, boundary conditions, and discretization parameters.

---

## Features
- 1D FEM for transient heat conduction
- Customizable:
  - number of elements (`noe`) and timesteps (`not`)
  - rod length (`L`) and simulation time (`T`)
  - material properties (`λ`, `ρ`, `c`)
  - boundary conditions (`inTemp`, `outTemp`)
- Saves full time history to a `.mat` file
- Live plot of nodal temperatures vs. position for each timestep

---

## Mathematical Background

The governing PDE for 1D transient heat conduction is
$$
\rho c \,\frac{\partial T}{\partial t} \;=\; \lambda\,\frac{\partial^2 T}{\partial x^2}, \qquad 0<x<L,\; 0<t\le T_{\text{end}}.
$$

Symbols:
- $T(x,t)$: temperature
- $\rho$: density, $c$: specific heat, $\lambda$: thermal conductivity

### Weak form
Multiply by a test function $v$ and integrate over the domain:
$$
\int_0^L \rho c\, v\, \frac{\partial T}{\partial t}\,dx \;+\;
\int_0^L \lambda\, \frac{\partial v}{\partial x}\,\frac{\partial T}{\partial x}\,dx
\;=\; \left[\lambda\, v\, \frac{\partial T}{\partial x}\right]_{x=0}^{x=L}.
$$

### Spatial and time discretization
With linear elements,
$$
C\,\dot{\mathbf{T}} + K\,\mathbf{T} = \mathbf{f},
$$
and the $\theta$-method in time:
$$
\left(\frac{C}{\Delta t} + \theta K\right)\mathbf{T}^{n+1}
=
\left(\frac{C}{\Delta t} - (1-\theta)K\right)\mathbf{T}^{n} + \mathbf{f}_\theta,
\quad \theta=\tfrac{2}{3}.
$$

---

## Requirements
- MATLAB (R2020a+ recommended)
- FEM helper functions (place in the repo or on your MATLAB path):
  - `assem.m` (assembly)
  - `solveq.m` (linear solver with Dirichlet BCs)

---

## Usage
1. Clone:
   ```bash
   git clone https://github.com/yourusername/your-repo.git
   cd your-repo
