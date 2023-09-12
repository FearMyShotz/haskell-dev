FROM debian:testing-slim

ARG MINIMAL_INSTALL
ARG GHC_VERSION
ARG CABAL_VERSION
ARG INSTALL_STACK
ARG INSTALL_CABAL
ARG INSTALL_HLS
ARG ADJUST_BASHRC

#ENV BOOTSTRAP_HASKELL_MINIMAL=${MINIMAL_INSTALL}
ENV BOOTSTRAP_HASKELL_NONINTERACTIVE=1
ENV BOOTSTRAP_HASKELL_GHC_VERSION=${GHC_VERSION}
ENV BOOTSTRAP_HASKELL_CABAL_VERSION=${CABAL_VERSION}
ENV BOOTSTRAP_HASKELL_INSTALL_STACK=${INSTALL_STACK}
ENV BOOTSTRAP_HASKELL_INSTALL_HLS=${INSTALL_HLS}
ENV BOOTSTRAP_HASKELL_ADJUST_BASHRC=${ADJUST_BASHRC}


#######################
# Install dependencies
#######################
RUN apt-get update
RUN apt-get install -y git vim curl sudo
RUN apt install -y build-essential libffi-dev libffi8ubuntu1 libgmp-dev libgmp10 libncurses-dev libncurses6 libtinfo6


#######################
# Set up user
#######################
ARG USERNAME=code
ARG USER_HOME=/home/$USERNAME
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Create the user
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    #
    # [Optional] Add sudo support. Omit if you don't need to install software after connecting.
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# Make app dir where project will be loaded to and make it working dir

# Set the default user. Omit if you want to keep the default as root.
USER $USERNAME

#######################
# Install Haskell
#######################

RUN mkdir $USER_HOME/install/
COPY scripts/install_haskell.sh $USER_HOME/install/install_haskell.sh
WORKDIR $USER_HOME/install/
RUN ./install_haskell.sh

RUN mkdir $USER_HOME/app
WORKDIR $USER_HOME/app

CMD sleep infinity
