# Cooperative UAV Obstacle Avoidance in Probabilistic Unknown Environment using Geometric Reinforcement Learning (GRL)

This repository contains a MATLAB simulation of a **Geometric Reinforcement Learning (GRL)** approach to multi-UAV obstacle avoidance in probabilistic, unknown environments.
It is based on the MEng research project conducted by Dan Paul Mirea at the University of Bristol.

## 🧠 Overview

Traditional UAV path planning methods often assume prior knowledge of the environment. This project addresses the more realistic case where the environment is initially unknown and threats are probabilistically distributed. It employs a geometric reinforcement learning algorithm that:
- Integrates both **distance** and **probabilistic risk** in path planning.
- Allows **cooperation between multiple UAVs** by sharing threat information.
- Supports real-time **dynamic re-planning** when new threats are discovered.

## 📽️ Demo

The simulation generates a visual step-by-step trajectory of two UAVs navigating toward a common target while avoiding probabilistic threats. Snapshots are saved in the `.\pic\` directory created per run.

## 🗺️ Key Features

- Environment modelled using Gaussian threat fields.
- Adaptive reward matrix based on distance and integrated risk.
- Dynamic cooperation between UAVs.
- Supports benchmark scenarios including:
  - Single UAV in uncertain environment.
  - Cooperative UAVs in complex maps (benchmark, bug trap, walls).
- Modular MATLAB design for customization and experimentation.

## 📁 Project Structure

```plaintext
├── main.txt                # Main entry point for simulation
├── main_UAVs.txt           # Core UAV loop and cooperation logic
├── initialize.txt          # Environment and variable setup
├── drawBackground.txt      # Visualization of paths and risk map
├── planning.txt            # GRL path planning logic
├── dangerMatrix.txt        # Cost computation based on threat map
├── Ematrix.txt             # Gaussian threat modeling
├── enemyGauss.txt          # Threat field generator
├── nexstep.txt             # Local movement controller
├── DanMirea_RP4.pdf        # Full research paper with background, theory, and results
