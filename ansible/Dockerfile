FROM centos:latest

RUN yum install -y epel-release && \
  yum install -y ansible

RUN useradd -s /bin/bash -m \
  -d /home/ansible \
  --uid 1000 \
  ansible 

WORKDIR /home/ansible
USER ansible

# ENTRYPOINT ["/usr/bin/ansible"]
CMD ["/usr/bin/ansible", "--help"]