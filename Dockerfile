FROM debian:testing-slim

ARG MINIMAL_INSTALL
ARG GHC_VERSION
ARG CABAL_VERSION
ARG INSTALL_STACK
ARG INSTALL_CABAL
ARG INSTALL_HLS
ARG ADJUST_BASHRC

ENV BOOTSTRAP_HASKELL_MINIMAL=${MINIMAL_INSTALL}
ENV BOOTSTRAP_HASKELL_NONINTERACTIVE=1
ENV BOOTSTRAP_HASKELL_GHC_VERSION=${GHC_VERSION}
ENV BOOTSTRAP_HASKELL_CABAL_VERSION=${CABAL_VERSION}
ENV BOOTSTRAP_HASKELL_INSTALL_STACK=${INSTALL_STACK}
ENV BOOTSTRAP_HASKELL_INSTALL_HLS=${INSTALL_HLS}
ENV BOOTSTRAP_HASKELL_ADJUST_BASHRC=${ADJUST_BASHRC}

# Install dependencies
RUN apt-get update
RUN apt-get install -y git vim curl
RUN apt install -y build-essential libffi-dev libffi8ubuntu1 libgmp-dev libgmp10 libncurses-dev libncurses6 libtinfo6

# Install Haskell
RUN mkdir /install
COPY ./install_haskell.sh /install/install_haskell.sh
WORKDIR /install
RUN ./install_haskell.sh

CMD /bin/bash