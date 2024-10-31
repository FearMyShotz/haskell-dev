#!/bin/bash

curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh

echo '. $HOME/.ghcup/env' >> $HOME/.bashrc
