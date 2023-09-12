# Haskell Dev Container

This repo provides a Docker container that includes common Haskell build tools 
so that you can start developing and building your Haskell app right away without
setting up a local dev environment.

Tools included in containser:
* GHC (ghcup recommended version)
* cabal (ghcup recommended version)
* stack (ghcup recommended version)
* haskell language server (ghcup recommended version)
* git and scm_breeze
* Vim (with optional [Vim IDE setup script](#setup-haskell-ide-in-vim))


## How to get the container image

### Get a prebuilt image
I have some prebuilt images uploaded to [DockerHub](https://hub.docker.com/r/bjing/haskell-dev-container).

Decide what ghc version you want, and pull it down by running:

```sh
docker pull bjing/haskell-dev-container:<tag>
```


### Build it yourself
You can also build the container image yourself.

1. check out this repo locally:

    ```sh
    git clone https://github.com/bjing/haskell-dev-container.git
    ```

2. Edit [scripts/install_haskell.env](scripts/install_haskell.env) to specify versions of the tools you'd like to install

3. Build the image by running:

    ```sh
    ./build.sh
    ```

This will generate a docker image `haskell-dev-container:latest`.


## How to use the image
Here I assume you're using a [prebuilt docker image on DockerHub](https://hub.docker.com/r/bjing/haskell-dev-container).

#### Command line
Go to the Haskell project you're working on in the terminal:

```sh
cd my-haskell-project
```

Then start the dev container and mount the project into it:
`code` is a pre-created user in the container:

```sh
docker run -d --rm --name haskell-dev-container -v .:/home/code/app bjing/haskell-dev-container:latest
```

Get into the container by running:

```sh
docker exec -it haskell-dev-container bash
```

Now you're inside the container with the project directory mounted. You can use
either `cabal` or `stack` depending on what you're using to build your project.
For example:

```sh
stack build
```

#### VSCode
TBD

## How to add tools that I need?
If you need tools that are not provided by the container, 
simply installed it through Debian's `apt` package manager, e.g.

```sh
sudo apt install <package_name>
```

Since the container user `code` has sudo privilege, you can
install any tools you want.

## Extras
#### Setup Haskell IDE in vim

The container image provides setup script for VIM Haskell IDE.

Simply run the setup script in /home/code/install:
```sh
cd ~/install
./setup_vim.sh
```
