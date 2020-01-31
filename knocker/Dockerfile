FROM python:latest


RUN export uid=1000 gid=1000 && \
    mkdir -p /home/userservice && \
    echo "userservice:x:${uid}:${gid}:Developer,,,:/home/userservice:/bin/bash" >> /etc/passwd && \ 
    echo "userservice:x:${uid}:" >> /etc/group && \ 
    chown ${uid}:${gid} -R /home/userservice

RUN pip install knocker

USER userservice
ENV HOME /home/userservice
ENTRYPOINT ["/usr/local/bin/knocker"]
