# GRCoordX

**Coordinate Transformation Analysis of Exact Solutions in General Relativity**

## Overview

GRCoordX is a systematic exploration of exact solutions in General Relativity under various coordinate transformations with emphasis on non-trivial coordinate systems such as toroidal coordinates. This repository contains Mathematica notebooks implementing the transformations using xAct, analyzing the resulting metrics, and exploring their geometric and physical properties.

## Project Goals

- Transform standard GR metrics into various coordinate systems
- Analyze the geometric properties of solutions in different representations
- Uncover subtleties and nuances introduced by coordinate transformations
- Provide a comprehensive geometric analysis of each transformed solution
- Focus on novel insights from representing spacetimes in toroidal coordinates

## Repository Structure

This repository is organized into series of Mathematica notebooks, each focusing on a specific spacetime and its transformations:

```
GRCoordX/
├── Series1_Minkowski/
│   ├── 1.1_Minkowski_Spherical.nb
│   ├── 1.2_Minkowski_Cylindrical.nb
│   ├── 1.3_Minkowski_Toroidal.nb
│   └── 1.4_Minkowski_Rindler.nb
├── Series2_Schwarzschild/
│   ├── 2.1_Schwarzschild_KruskalSzekeres.nb
│   ├── 2.2_Schwarzschild_Isotropic.nb
│   ├── 2.3_Schwarzschild_Toroidal.nb
│   └── 2.4_Schwarzschild_Cartesian.nb
├── Series3_Kerr/
│   ├── 3.1_Kerr_BoyerLindquist.nb
│   ├── 3.2_Kerr_Cartesian.nb
│   ├── 3.3_Kerr_Toroidal.nb
│   └── 3.4_Kerr_ProlateSpheroid.nb
├── Series4_DeSitter/
│   ├── 4.1_DeSitter_GlobalStatic.nb
│   ├── 4.2_DeSitter_Toroidal.nb
│   ├── 4.3_AntiDeSitter_GlobalPoincare.nb
│   └── 4.4_AntiDeSitter_Toroidal.nb
├── Series5_Advanced/
│   ├── 5.1_ReissnerNordstrom_Transformations.nb
│   ├── 5.2_KerrNewman_Transformations.nb
│   ├── 5.3_FLRW_Coordinates.nb
│   └── 5.4_TaubNUT_Toroidal.nb
├── Utils/
│   ├── MetricAnalysisTools.wl
│   ├── CoordinateTransformationHelpers.wl
│   └── VisualizationFunctions.wl
└── Documentation/
    ├── CoordinateSystems.md
    ├── MetricAnalysisGuide.md
    └── GeometricQuantitiesReference.md
```

## Analysis Framework

Each notebook follows a consistent structure for the analysis of transformed metrics:

1. **Original Metric Definition**: Standard form of the spacetime solution
2. **Coordinate Transformation**: Explicit transformation equations
3. **Jacobian Computation**: Analysis of the transformation properties
4. **Metric Transformation**: Implementation of the coordinate change
5. **Verification**: Checking the validity of the transformed solution
6. **Geometric Analysis**:
   - Metric signature and determinant
   - Curvature scalars (Ricci scalar, Kretschmann, Weyl invariants)
   - Coordinate ranges and singularities
   - Horizon conditions
   - Killing vector fields
   - Light cone structure and causality
   - Jacobian invertibility regions
7. **Visualization**: Coordinate surfaces and embedding diagrams (where applicable)

## Technical Requirements

- Mathematica 13.0 or higher
- xAct package suite (xTensor, xCoba, etc.)
- xTras package (optional, for additional tensor capabilities)

## Installation and Setup

1. Clone this repository:
   ```
   git clone https://github.com/username/GRCoordX.git
   ```

2. Ensure Mathematica and xAct are properly installed. For xAct installation instructions, visit [xAct's official website](http://www.xact.es).

3. Load the notebooks in Mathematica.

## Special Focus: Toroidal Coordinates

A primary contribution of this project is the detailed analysis of exact GR solutions in toroidal coordinates. This perspective offers unique insights into:

- Horizon geometry in black hole spacetimes
- Singularity structure in Kerr and Kerr-Newman metrics
- Cosmological horizons in de Sitter space
- Causal structures in various spacetimes

## Usage Examples

Each notebook can be executed independently to perform the transformation and analysis. For example, to explore the Schwarzschild metric in toroidal coordinates:

1. Open `Series2_Schwarzschild/2.3_Schwarzschild_Toroidal.nb`
2. Execute the notebook cells sequentially
3. Review the transformed metric and geometric analysis
4. Explore the visualizations of coordinate surfaces

## Methodology

The project employs rigorous tensor manipulation techniques using the xAct package to ensure coordinate-invariant analysis. Each transformation is verified through:

- Consistency checks of curvature invariants
- Examination of singularity structure
- Analysis of metric signature and determinant
- Verification of Einstein field equations in the transformed coordinates

## Contributing

Contributions to GRCoordX are welcome. To contribute:

1. Fork the repository
2. Create a new branch for your feature
3. Add your notebook or improvements
4. Submit a pull request

Please ensure that new notebooks follow the established structure and include comprehensive analysis of the transformed metrics.

## Citation

If you use these notebooks in your research, please cite:

```
@misc{GRCoordX2025,
  author = {Your Name},
  title = {GRCoordX: Coordinate Transformation Analysis of Exact Solutions in General Relativity},
  year = {2025},
  publisher = {GitHub},
  url = {https://github.com/username/GRCoordX}
}
```

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Contact

For questions or collaboration opportunities, please open an issue on this repository or contact [your email/contact information].
