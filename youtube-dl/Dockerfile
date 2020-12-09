FROM ubuntu:16.04

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN apt update && \
    apt install -y python3 python3-pip git locales && \
    ln /usr/bin/python3 /usr/bin/python && \
    ln /usr/bin/pip3 /usr/bin/pip && \
    locale-gen en_US.UTF-8 && \
    apt install -y ffmpeg

RUN  pip install --upgrade youtube-dl

RUN useradd -s /bin/bash youtube-dl -m -d /home/youtube-dl

COPY --chown=1000:1000 get-audio.sh /home/youtube-dl/
COPY --chown=1000:1000 get-video.sh /home/youtube-dl/
COPY --chown=1000:1000 get-batch.sh /home/youtube-dl/

WORKDIR /home/youtube-dl
USER youtube-dl

RUN ["/bin/bash"]

