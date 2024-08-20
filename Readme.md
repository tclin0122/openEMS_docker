# Docker Image for GUI Applications with XQuartz

This Docker image provides an environment for running `openEMS` with graphic using X11.

## Overview

- **Base Image**: Ubuntu 22.04
- **Includes**:
  - `XQuartz` for GUI applications on macOS
  - Various dependencies and libraries for `openEMS`

## Features

- Install `openEMS` and related dependencies
- Run GUI applications within Docker
- Access GUI applications using X11

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

## Building the Docker Image

To build the Docker image from the provided Dockerfile:

```bash
docker build -t openems_docker .
```

## Running the Docker Container
Allow Connections:
```bash
xhost +localhost
xhost +127.0.0.1
```
Run the Docker Container:
```bash
docker run -it \
    -e DISPLAY=host.docker.internal:0 \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    openems_docker
```

## Reference
[1] [openEMS installation](https://docs.openems.de/install.html).  
[2] [openEMS documentation](https://docs.openems.de).  
[3] [openEMS](https://www.openems.de).  
[4] [XQuartz.org](https://www.xquartz.org/).