FROM alpine:latest

RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh

RUN addgroup -g 1000 -S git

RUN adduser --home /home/git \
 --shell /bin/bash \
 --uid 1000 -S \
 -G git \
 git


WORKDIR /home/git
USER git


CMD ["git", "--help"]