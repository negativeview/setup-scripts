#!/bin/bash

# Basic installation. Required for the rest, below.
apt update
apt install apt-transport-https ca-certificates curl git gnupg lsb-release

# Python install.
apt install python3-pip

# Cuda install
apt install cuda-drivers

# Docker install.
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

apt update
apt install docker-ce docker-ce-cli containerd.io
