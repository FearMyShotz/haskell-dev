#!/bin/bash

source install_haskell.env

docker build \
  --build-arg GHC_VERSION=9.2.8 \
  --build-arg CABAL_VERSION=latest \
  --build-arg INSTALL_STACK=1 \
  --build-arg INSTALL_CABAL=1 \
  --build-arg INSTALL_HLS=1 \
  --build-arg ADJUST_BASHRC=P \
  -t my-haskell-dev-container:latest .
