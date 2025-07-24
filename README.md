# UAV Cooperative Obstacle Avoidance in Probabilistic Unknown Environment using Geometric Reinforcement Learning (GRL)

This repository contains the MATLAB implementation of my MEng research project in Aerospace Engineering at the University of Bristol:  
**"Cooperative Obstacle Avoidance in Probabilistic Unknown Environment using Reinforcement Learning"**.

## Overview

Traditional UAV path planning methods often assume prior knowledge of the environment. This project addresses the more realistic case where the environment is initially unknown and threats are probabilistically distributed. It employs a geometric reinforcement learning algorithm that:
- Integrates both **distance** and **probabilistic risk** in path planning.
- Allows **cooperation between multiple UAVs** by sharing threat information.
- Supports real-time **dynamic re-planning** when new threats are discovered.

## Demo

The simulation generates a visual step-by-step trajectory of two UAVs navigating toward a common target while avoiding probabilistic threats. Snapshots are saved in the `.\pic\` directory created per run.

## Key Features

- Environment modelled using Gaussian threat fields.
- Adaptive reward matrix based on distance and integrated risk.
- Dynamic cooperation between UAVs.
- Supports benchmark scenarios including:
  - Single UAV in uncertain environment.
  - Cooperative UAVs in complex maps (benchmark, bug trap, walls).
- Modular MATLAB design for customization and experimentation.

## What the Simulation Does

The MATLAB simulation animates the paths of two UAVs moving from defined starting points to a target location, avoiding unknown obstacles represented as probabilistic risk fields. The UAVs update their plans in real-time as new threats are detected within their observation radius.

You can:
- Observe individual vs cooperative UAV behavior.
- Tune the risk aversion (`K`), learning episodes, and sensing range.
- Run benchmark maps such as the "bug trap" and "collateral walls" to evaluate strategy robustness.

## 📁 Project Structure

```plaintext
├── main.m                # Main entry point for simulation
├── main_UAVs.m           # Core UAV loop and cooperation logic
├── initialize.m          # Environment and variable setup
├── drawBackground.m      # Visualization of paths and risk map
├── planning.m            # GRL path planning logic
├── dangerMatrix.m        # Cost computation based on threat map
├── Ematrix.m             # Gaussian threat modeling
├── enemyGauss.m          # Threat field generator
├── nexstep.m             # Local movement controller
├── DanMirea_RP4.pdf        # Full research paper with background, theory, and results
```

## Citation
```
@unpublished{mirea2020grl,
  author       = {Dan Paul Mirea},
  title        = {Cooperative Obstacle Avoidance in Probabilistic Unknown Environment using Reinforcement Learning},
  institution  = {Department of Aerospace Engineering, University of Bristol},
  year         = {2020},
  note         = {MEng Individual Research Project},
  url          = {https://github.com/engdanmirea/uav-grl-cooperative-pathplanning}
}
```

