FROM ubuntu:latest
LABEL maintainer="jberenguer <berenguer.jon@gmail.com>"

RUN apt update &&     apt-get install -y httrack

ENTRYPOINT ["/usr/bin/httrack"]
