#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

sudo apt update

# build-essential covers make, gcc, and basic libc
sudo apt install -y build-essential g++ clang clangd

# Explicitly pulling the dev package for the standard library
sudo apt install -y libstdc++-14-dev
