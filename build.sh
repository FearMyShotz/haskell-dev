#!/bin/bash

source scripts/install_haskell.env

docker build \
  --build-arg MINIMAL_INSTALL=${BOOTSTRAP_HASKELL_MINIMAL} \
  --build-arg NONINTERACTIVE=${BOOTSTRAP_HASKELL_NONINTERACTIVE} \
  --build-arg GHC_VERSION=${BOOTSTRAP_HASKELL_GHC_VERSION} \
  --build-arg CABAL_VERSION=${BOOTSTRAP_HASKELL_CABAL_VERSION} \
  --build-arg INSTALL_STACK=${BOOTSTRAP_HASKELL_INSTALL_STACK} \
  --build-arg INSTALL_HLS=${BOOTSTRAP_HASKELL_INSTALL_HLS} \
  --build-arg ADJUST_BASHRC=${BOOTSTRAP_HASKELL_ADJUST_BASHRC} \
  -t my-haskell-dev-container:latest .
