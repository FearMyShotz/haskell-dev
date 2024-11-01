FROM bjing/dev-container-base:latest

#ENV BOOTSTRAP_HASKELL_MINIMAL=${MINIMAL_INSTALL}
ENV BOOTSTRAP_HASKELL_NONINTERACTIVE=1
ENV BOOTSTRAP_HASKELL_GHC_VERSION=recommended
ENV BOOTSTRAP_HASKELL_CABAL_VERSION=recommended
ENV BOOTSTRAP_HASKELL_INSTALL_STACK=1
ENV BOOTSTRAP_HASKELL_INSTALL_HLS=1
ENV BOOTSTRAP_HASKELL_ADJUST_BASHRC=P


#######################
# Install dependencies
#######################
USER root
RUN apt-get update
RUN apt-get install -y build-essential curl libffi-dev libffi8 libgmp-dev libgmp10 libncurses-dev libncurses6 libtinfo6 pkg-config


#######################
# Set up user
#######################
ARG USERNAME=code
ARG USER_HOME=/home/$USERNAME

# Set the default user. Omit if you want to keep the default as root.
USER $USERNAME


#######################
# Install Haskell
#######################
RUN mkdir -p $USER_HOME/install/
COPY scripts/install_haskell.sh $USER_HOME/install/install_haskell.sh
WORKDIR $USER_HOME/install/
RUN ./install_haskell.sh


RUN mkdir $USER_HOME/app
WORKDIR $USER_HOME/app

CMD sleep infinity
