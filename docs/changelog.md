# Changelog

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