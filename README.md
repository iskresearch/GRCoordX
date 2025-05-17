# Einstein Atlas

**A Comprehensive Computational Database of Exact Solutions to Einstein’s Field Equations**

---

### Overview

Welcome to **Einstein Atlas**, an open research initiative by the **Independent Society of Knowledge (ISK)** aimed at creating the most extensive, rigorously derived, and computationally accessible repository of exact solutions to Einstein’s Field Equations (EFEs).

Our goal is to systematically catalog **all known exact metrics**—from Minkowski and Schwarzschild to the most complex solutions—together with their coordinate transformations and global causal structures, represented via Penrose diagrams. Each solution is accompanied by detailed symbolic derivations using **Mathematica** and **xAct**, ensuring scientific rigor, reproducibility, and clarity.

---

### What You’ll Find Here

- **Metric Folders**: Each exact solution has a dedicated directory.
  - `{MetricName}-derivation.nb` — Full symbolic derivation and tensor computations.
  - `{MetricName}-in-{Coordinate}.nb` — Coordinate transformations into various meaningful systems (e.g., Spherical, Kruskal, Isotropic).
  - `diag-{MetricName}-in-{Coordinate}.nb` — Penrose diagrams visualizing the global causal structure in those coordinates.
  - `metadata.json` — Machine-readable metadata summarizing key properties and references.

- **Comprehensive Coverage**: We aim to support *all physically and mathematically relevant* coordinate systems for every metric.

- **Future-Ready**: While starting with Mathematica + xAct, the project is designed to incorporate other symbolic frameworks such as SageMath and SymPy.

---

### Why Einstein Atlas?

- **Scientific Rigor**: Every metric is derived and checked symbolically.
- **Reproducibility**: Notebooks allow anyone to verify, extend, or adapt computations.
- **Educational Value**: A tool for researchers, educators, and students to explore exact solutions in GR with hands-on computational resources.
- **Open Collaboration**: Encouraging contributions, corrections, and expansions from the global community.

---

### How to Use This Repository

- **Exploration**: Open the notebooks in Mathematica to study detailed derivations and coordinate transformations.
- **Extension**: Add new metrics or coordinates following the naming and organizational conventions.
- **Visualization**: Use the Penrose diagram notebooks to understand the causal structure of spacetimes.
- **Automation**: Future releases will include scripts and APIs to query and interact programmatically.

---

### Getting Started

1. Clone the repo:
   ```bash
   git clone https://github.com/ISK-Research/einstein-atlas.git
   cd einstein-atlas
   ````

2. Open any `.nb` file in Mathematica. Ensure you have **xAct** installed (see [xAct.net](http://www.xact.es)).

3. Follow the notebooks’ instructions to run the derivations or explore coordinate charts.

---

### Contribution Guidelines

We welcome new metric submissions, coordinate transformations, and diagram enhancements. Please:

* Follow the established folder and file naming conventions.
* Provide a complete derivation notebook.
* Include references in `metadata.json`.
* Test notebooks for consistency and correctness.

See [CONTRIBUTING.md](./CONTRIBUTING.md) for detailed instructions.

---

### License & Citation

This project is licensed under the **GPL-3.0 License**.

If you use **Einstein Atlas** in your research, please cite:

> Independent Society of Knowledge (ISK), *Einstein Atlas*, [https://github.com/iskresearch/einstein-atlas](https://github.com/iskresearch/einstein-atlas)

---

### Contact & Support

For questions, suggestions, or to join the ISK research community, reach out via:

* Website: [https://research.iskportal.com/einstein-atlas](https://research.iskportal.com/einstein-atlas)
* Email: [contact@iskportal.com](mailto:contact@iskportal.com)
* GitHub Discussions: [Einstein Atlas Discussions](https://github.com/ISK-Research/Einstein-Atlas/discussions)

---

### About ISK

The **Independent Society of Knowledge (ISK)** is a global research collective dedicated to advancing open, reproducible, and collaborative science. Our mission is to **break the chains** of knowledge silos and empower researchers worldwide.



