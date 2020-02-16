FROM alpine:latest

RUN apk update && apk upgrade

RUN apk add --no-cache bash p7zip

RUN addgroup -g 1000 -S p7zip

RUN adduser --home /home/p7zip \
 --shell /bin/bash \
 --uid 1000 -S \
 -G p7zip \
 p7zip


WORKDIR /home/p7zip
USER p7zip

ENTRYPOINT ["/usr/bin/7z"]
