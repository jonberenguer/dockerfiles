FROM alpine:latest

RUN apk update && apk upgrade

RUN apk add --no-cache bash transmission-cli

RUN addgroup -g 1000 -S transmission
 
RUN adduser --home /home/transmission \ 
 --shell /bin/bash \ 
 --uid 1000 -S \ 
 -G transmission \ 
 transmission
 
 
WORKDIR /home/transmission
USER transmission
 
 
CMD ["/usr/bin/transmission-cli", "--help"] 



