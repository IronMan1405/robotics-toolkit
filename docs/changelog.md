# Changelog

## v0.5.0

### Added
- Workspace visualization utilities for serial manipulators.
- Exhaustive joint-space sampling to compute reachable workspaces.
- Workspace visualization examples for planar 2R and RRPR SCARA manipulators.
- Optional coordinate frame visualization during workspace generation.

### Improved
- Introduced reusable workspace visualization functions independent of specific robot examples.
- Adopted argument validation (`arguments` blocks) for visualization utilities.
- Refined visualization workflow by separating robot geometry from joint-space sampling.

### Verified
- 2R reachable workspace against analytical reach limits.
- RRPR SCARA reachable workspace using revolute and prismatic joint sweeps.
- Forward kinematics integration across all sampled joint configurations.

### Notes
- Current workspace generation uses uniform grid sampling in joint space.
- Higher-DOF manipulators incur exponential computational cost; future releases may introduce randomized sampling or parallelization.

---

## v0.4.1

### Added
- Multiple analytical inverse kinematics solutions (elbow-up and elbow-down) for planar manipulators.
- Reachability checks before solving analytical inverse kinematics.

### Improved
- Unified the inverse kinematics API by returning all valid joint configurations as a solution matrix.
- Refactored `IK3R` and `IKSCARA` to build upon the updated `IK2R` implementation.

### Verified
- Multiple inverse kinematics solutions against forward kinematics.
- Reachability validation for unreachable target poses.

---

## v0.4.0

### Added
- Analytical inverse kinematics for a planar 2R manipulator (`IK2R.m`).
- Analytical inverse kinematics for a planar 3R manipulator (`IK3R.m`) using wrist-center decomposition.
- Analytical inverse kinematics for an RRPR SCARA manipulator (`IKSCARA.m`).

### Improved
- Adopted a modular inverse kinematics workflow by reusing `IK2R` for higher-DOF manipulators.
- Verified analytical inverse kinematics by comparing solutions against forward kinematics.

### Verified
- 2R inverse kinematics against symbolic forward kinematics.
- 3R inverse kinematics using end-effector position and orientation.
- RRPR SCARA inverse kinematics using position (`x, y, z`) and orientation (`φ`).

---

## v0.3.0

### Added
- Generic `FK.m` function for serial manipulators using Standard DH parameters.
- Support for arbitrary \(n\)-link kinematic chains through iterative transformation composition.
- Automatic homogeneous transformation chaining from a DH table.

### Improved
- Generalized forward kinematics from hardcoded 2R/3R examples to a reusable algorithm.
- Simplified the workflow for deriving forward kinematics of new robot configurations.

### Verified
- Generic forward kinematics against symbolic 2R and 3R analytical solutions.
- Correct transformation chaining using the Standard DH convention.

---

## v0.2.0

### Added
- Standard Denavit-Hartenberg (`DH.m`) transformation implementation.
- Symbolic forward kinematics workflow using MATLAB Symbolic Math Toolbox.
- Planar 2R and 3R forward kinematics examples.

### Changed
- Adopted a consistent DH frame assignment convention.
- Expanded the toolkit architecture to support higher-level kinematics modules.

### Verified
- Standard DH transformation implementation.
- Symbolic forward kinematics against analytical planar manipulator equations.

---

## v0.1.0

### Added
- Homogeneous transformation utilities.
  - Rotation about the X, Y, and Z axes.
  - Translation along the X, Y, and Z axes.
  - General 3D translation.
- `PlotFrame` utility for visualizing 3D coordinate frames.
- Initial frame visualization example.

### Established
- Initial project directory structure.
- MATLAB utility framework for future robotics modules.