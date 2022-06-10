#!/bin/bash

# Install the required libraries that are available as debs.
sudo apt-get update
sudo apt-get install -y \
    clang \
    cmake \
    g++ \
    git \
    google-mock \
    libboost-all-dev \
    libcairo2-dev \
    libcurl4-openssl-dev \
    libeigen3-dev \
    libgflags-dev \
    libgoogle-glog-dev \
    liblua5.2-dev \
    libsuitesparse-dev \
    lsb-release \
    ninja-build \
    stow

# Install Ceres Solver and Protocol Buffers support if available.
# No need to build it ourselves.
if [[ "$(lsb_release -sc)" = "focal" || "$(lsb_release -sc)" = "buster" ]]
then
  sudo apt-get install -y python3-sphinx libgmock-dev libceres-dev protobuf-compiler
else
  sudo apt-get install -y python-sphinx
  if [[ "$(lsb_release -sc)" = "bionic" ]]
  then
    sudo apt-get install -y libceres-dev
  fi
fi
