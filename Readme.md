# Docker Image for openEMS

## Overview
This Docker image provides an environment for running `openEMS` with graphic using X11. openEMS is a free and open electromagnetic field solver using the FDTD method. Develop your Python code in the `src` directory to develop locally and execute inside a containerized environment.

## Project Structure

- **`Dockerfile`**: Defines the Docker image and its environment.
- **`Makefile`**: Provides commands to build and run the Docker container.
- **`src/`**: Contains the Python script `Simple_Patch_Antenna.py`.
- **`README.md`**: This file, containing project documentation.

## Overview

- **Base Image**: Ubuntu 22.04
- **Includes**:
  - `XQuartz` for GUI applications on macOS
  - Various dependencies and libraries for `openEMS`

## Features

- Install `openEMS` and related dependencies
- Run GUI applications within Docker
- Access GUI applications using X11
- Develop locally and execute your script inside a containerized environment.


## Prerequisites

### On macOS

1. **Install XQuartz**:
   - Download and install XQuartz from [XQuartz.org](https://www.xquartz.org/).
   - Restart your macOS after installation to apply changes.
2. **Check DISPLAY Variable:**:
   - open a terminal and run
   ```bash
   echo $DISPLAY
   ```
   It should output something like localhost:0 or localhost:0.0.
   - manually set DISPLAY
   ```bash
   export DISPLAY=localhost:0
   ```

### On Linux

- Make sure `xhost` is installed and configured properly to allow Docker containers to connect to the X server.
Allow Connections:
```bash
xhost +localhost
xhost +127.0.0.1
```
## Docker Setup

### Build the Docker Image

To build the Docker image, run the following command:

```bash
make build
```
### Run the Docker Container

To run the Python script inside the Docker container, use:

```bash
make run
```

### Clean Up Docker Resources

To remove dangling Docker containers, networks, and images, use:

```bash
make clean
```


## Reference
[1] [openEMS installation](https://docs.openems.de/install.html).  
[2] [openEMS documentation](https://docs.openems.de).  
[3] [openEMS](https://www.openems.de).  
[4] [XQuartz.org](https://www.xquartz.org/).
