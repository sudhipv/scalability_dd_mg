# Scalable Domain Decomposition & Multigrid Benchmarks

This repository hosts the FreeFEM++ input files, auxiliary scripts, and reference data that were used to study how different domain decomposition (DD) and multigrid (MG) strategies scale for diffusion-dominated PDEs. The deterministic folders focus on steady and transient Poisson/heat problems, while the stochastic folders extend the same solvers with polynomial chaos expansions (PCE) to capture input randomness modelled either as random variables or random processes.

## Repository Layout

| Path | Purpose | Highlights |
| --- | --- | --- |
| `deterministic/Linear` | Linear Poisson DD/MG solvers | `poisson_1L.edp`, `poisson_2L*.edp`, VTK outputs, Slurm example `runff_niagara_weak.sh` |
| `deterministic/NL` | Non-linear Poisson DD solver with Picard iterations | `NL_1L.edp`, `NL_2L.edp`, timing logs, MATLAB plotter `MGNL.m` |
| `deterministic/heat` | Transient heat equation with multilevel MG preconditioner | `heat_2L.edp` |
| `deterministic/heatNL` | Non-linear heat equation benchmarks | `heatNL_1L.edp`, `heatNL_2L.edp`, MATLAB script `MGheat.m` |
| `deterministic/DD_vsMG` | Side-by-side DD vs MG experiments for linear and non-linear Poisson models | `poisson_2L_V2/V3*.edp`, `NL_2L*.edp`, error logs |
| `stochastic/process` | Random-process driven Poisson problems | FreeFEM++ decks under `linear/` & `nonlinear/`, Slurm launchers |
| `stochastic/rvariable` | Random-variable (PCE) driven Poisson problems | `poisson_L` and `poisson_NL` solvers, macro generators (`generate*.edp`), PCE tensors, weak/strong scaling results |

## Deterministic Models

### Linear Poisson (`deterministic/Linear`)
- `poisson_1L.edp` is the single-level DD benchmark; the `poisson_2L*.edp` variants add coarse grids/multigrid V2–V3 refinements and AMG comparisons.
- Launch templates (e.g., `runff_niagara_weak.sh`) illustrate how weak-scaling studies were run on Slurm clusters using `FreeFem++-mpi`.
- `U_4*.vtu`/`.pvd` files provide sample VTK output for visualization; `A.m` contains MATLAB post-processing utilities.

### Non-linear Poisson (`deterministic/NL`)
- `NL_1L.edp` & `NL_2L.edp` solve a coefficient-dependent Poisson problem with Picard iterations. The solver loads PETSc and HPDDM, constructs weighted operators via `macro_ddm.idp`, and reports convergence histories in `error_iter_picard_ddm.dat`.
- `runff_niagara_weak.sh` holds the reference submission script used for scaling studies.

### Heat Equation (`deterministic/heat` & `deterministic/heatNL`)
- `heat_2L.edp` demonstrates a transient MG solve with PETSc configured for multiplicative multigrid across recursively generated meshes (`buildMatRecursive` plus `set(MG, ...)` options).
- The non-linear variant in `heatNL` mirrors the structure but augments it with MATLAB diagnostics (`MGheat.m`) and multiple FreeFEM decks (`heatNL_1L.edp`, `heatNL_2L.edp`).

### DD vs MG Comparisons (`deterministic/DD_vsMG`)
- Collects lightly-edited Poisson and non-linear Poisson decks used to isolate the performance delta between classical DD and multigrid-enhanced variants.
- Logs (e.g., `error_iter_picard_ddm.dat`) make it easy to reproduce the figures referenced in associated reports.

## Stochastic Models

### Random Processes (`stochastic/process`)
- Contains the original experiments described in `process_updates.txt`, including the observation that increasing the Gaussian input standard deviation can render the assembled matrices indefinite unless the Cijk tensors are corrected.
- `runff_beluga.sh` and `runff_niagara_weak.sh` show how the stochastic decks were executed on clusters (IntelMPI modules, Slurm directives, etc.).
- The `nonlinear/` examples extend the deterministic Picard solver to process-driven inputs.

### Random Variables (`stochastic/rvariable`)
- Houses two solver families: `poisson_L` (linear) and `poisson_NL` (non-linear). Each contains FreeFEM++ source (`poisson_ss*.edp`), macro generators (`generate.edp`, `generate_nl.edp`), reference meshes (`square.geo/.msh`), and automation scripts (`clear.sh`).
- `generate.edp`/`generate_nl.edp` emit helper files (`ssinit.edp`, `ssweakcomp.edp`, etc.) by taking polynomial chaos orders (`-ordo`, `-ordi`) and statistical parameters (`-muG`, `-sigmaG`) via `getARGV`. This enables reproducible PCE assembly.
- `Tijkl` directories contain MATLAB `.m` scripts and multi-index tables for higher-order chaos tensors, while `strong/` and `weak/` folders provide EPS/Fig plots plus scaling logs.
- The `code/output/` directory holds example VTK snapshots (`U_*.pvd`/`.vtu`) that showcase the stochastic solution fields.

## Requirements

- **FreeFEM++** compiled with MPI support and linked to **PETSc** and **HPDDM**, matching what the `.edp` scripts load via `load "PETSc"` and `load "hpddm"`.
- **MPI runtime** (`mpirun`/`mpiexec`) available on the execution host; examples assume Slurm-managed clusters such as Niagara or Béluga.
- Optional visualization in **ParaView/VisIt** for `.pvd`/`.vtu` outputs.
- Optional **MATLAB/Octave** for the post-processing utilities in `MG*.m` and scaling plot generators in `stochastic/**/strong|weak`.
- For mesh regeneration or edits, install **Gmsh** to work with the `.geo` sources under `stochastic/rvariable`.

## Running the Examples

### Deterministic Quick Start
```bash
# from the repo root
mpirun -np 40 FreeFem++-mpi deterministic/Linear/poisson_1L.edp -m 750 -n 750 -nw -log_view
```
Common flags:
- `-m/-n` set the structured mesh density.
- `-nw` prevents the GUI from opening on headless nodes.
- PETSc options (e.g., `-log_view`) can be appended directly; additional KSP/PC tuning is embedded in each `.edp`.

To compare multi-level variants, point the same command at `poisson_2L_V2.edp` or `poisson_2L_V3.edp`. The `dd_vsMG` folders expose AMG-based runs (`poisson_2L_V3_amg.edp`, `NL_2L_AMG.edp`) for side-by-side testing.

### Submitting to Slurm
```bash
sbatch deterministic/Linear/runff_niagara_weak.sh
```
Edit the script to match your allocation (`--account`, `--nodes`, etc.) and FreeFEM++ installation path before submitting. The templates already load the Niagara/Béluga module stacks that were used for the published scaling data.

### Stochastic Random-Variable Workflow
```bash
cd stochastic/rvariable/poisson_L/code
FreeFem++ generate.edp -ordo 3 -ordi 2 -sigmaG 0.3
mpirun -np 160 FreeFem++-mpi ../poisson_ss_2L.edp -m 400 -n 400 -nw
```
1. Run the generator script with the desired chaos orders/statistics. This writes the helper macros consumed by the solver.
2. Launch the solver with `FreeFem++-mpi`, optionally sweeping mesh sizes or polynomial orders to replicate the weak/strong scaling tests captured under `weak/` and `strong/`.

For the random-process branch, use `stochastic/process/runff_beluga.sh` or craft a similar `mpirun` command pointing at the desired `.edp` (`poissonNL_process2L.edp`, etc.). When increasing `sigmaG`, monitor the PETSc eigenvalues to ensure the assembled matrix remains definite; see `process_updates.txt` for context.

## Output & Post-processing

- Numerical solutions are written as ParaView-ready `.pvd/.vtu` files (`deterministic/Linear/U_*`, `stochastic/rvariable/**/output/`).
- Time-to-solution and iteration counts are echoed to STDOUT/Slurm logs; representative logs are stored under `stochastic/**/weak|strong` and `deterministic/NL/error_iter*.dat`.
- MATLAB scripts (`MGheat.m`, `MGNL.m`, `stochastic/**/plot_*.m`) recreate the figures used in the accompanying reports. They assume the log files remain in the same directories; update the paths if you relocate the data.

## Tips & Troubleshooting

- **Indefinite matrices**: When the Gaussian input standard deviation grows, PCE systems can become indefinite. Regenerating `Cijk` with the corrected multi-index tables (see comments in `stochastic/process/process_updates.txt`) resolves the issue.
- **Macro dependencies**: Several `.edp` files rely on `macro_ddm.idp` and similar helper files that ship with FreeFEM++. Ensure those are discoverable via `FF_INSTALL_PATH/idp/` or adjust your `FF_INCLUDEPATH`.
- **VTK cleanup**: Use the provided `clear.sh` scripts inside stochastic code folders to purge generated helper files and VTK outputs between runs.
- **Reproducibility**: Capture PETSc logs (`-log_view`) and VTK snapshots when sweeping processor counts so you can validate both convergence behavior and scaling statistics.

## Contributing

The repository mirrors research snapshots rather than a packaged library. If you extend the solvers (new PDEs, preconditioners, stochastic inputs), keep the following in mind:
- Add a short README inside any new folder summarizing what changed and how to rerun the cases.
- Version-control only the `.edp`, `.m`, `.msh`, and representative `.out` files. Keep large solver outputs out of the repo or compress them.
- When targeting a new cluster, duplicate and adapt the nearest `runff_*.sh` script so others can follow the workflow.

## Contact

Sudhi Sharma P V  
[sudhisharmapadillath@gmail.com](mailto:sudhisharmapadillath@gmail.com)
