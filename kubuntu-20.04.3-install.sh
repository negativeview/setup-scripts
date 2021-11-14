#!/bin/bash

# Basic installation. Required for the rest, below.
apt update
apt install apt-transport-https ca-certificates cmake curl git

# Python install.
apt install python3-pip

# Cuda install
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
wget https://developer.download.nvidia.com/compute/cuda/11.5.0/local_installers/cuda-repo-ubuntu2004-11-5-local_11.5.0-495.29.05-1_amd64.deb
dpkg -i cuda-repo-ubuntu2004-11-5-local_11.5.0-495.29.05-1_amd64.deb
apt-key add /var/cuda-repo-ubuntu2004-11-5-local/7fa2af80.pub
apt update
apt install cuda

# Vulkan
apt install libx11-dev libxcb1-dev libxrandr-dev libxinerama-dev libxcursor-dev libxi-dev
git clone --recurse-submodules https://github.com/KhronosGroup/Vulkan-Samples.git
cd Vulkan-Samples
cmake -G "Unix Makefiles" -H. -Bbuild/linux -DCMAKE_BUILD_TYPE=Release
cmake --build build/linux --config Release --target vulkan_samples -- -j4


# Docker install.
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

apt update
apt install docker-ce docker-ce-cli containerd.io
