FROM debian:testing-slim

RUN apt-get update
RUN apt-get install -y git vim curl
RUN apt install -y build-essential libffi-dev libffi8ubuntu1 libgmp-dev libgmp10 libncurses-dev libncurses6 libtinfo6

CMD /bin/bash
