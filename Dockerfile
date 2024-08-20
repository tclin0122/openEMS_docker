# Base image
From ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive 
# Install required packages
RUN apt-get update && \
    apt-get install -y git
RUN apt-get install -y libx11-dev x11-apps
RUN apt-get install -y python3-tk

## Install dependancies for openEMS
RUN apt-get install -y build-essential cmake libhdf5-dev libvtk7-dev libboost-all-dev libcgal-dev libtinyxml-dev qtbase5-dev libvtk7-qt-dev
RUN apt-get install -y python3-dev libhdf5-dev
RUN apt-get install -y pkg-config
## Install octave
RUN apt-get install -y octave liboctave-dev
## Install additonal dependencies for hyp2mat
RUN apt-get install -y gengetopt help2man groff pod2pdf bison flex libhpdf-dev libtool

## Install python
RUN apt install -y python3.11
RUN apt install -y python3-pip
RUN pip install numpy matplotlib Cython pyproject-toml
RUN pip install --upgrade pip wheel
RUN pip install setuptools==58.2.0

RUN pip install h5py

# Set the working directory
WORKDIR /app

## Start installation
RUN git clone --recursive https://github.com/thliebig/openEMS-Project.git
WORKDIR /app/openEMS-Project
RUN ./update_openEMS.sh ~/opt/openEMS --with-hyp2mat --with-CTB --python

# Set the working directory inside the container
WORKDIR /app
# Copy your Python script into the container
COPY src/Simple_Patch_Antenna.py /app/

# Default command
CMD ["bash"]