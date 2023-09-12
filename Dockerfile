FROM debian:testing-slim

RUN apt-get update
RUN apt-get install -y git vim curl

CMD /bin/bash
