FROM archlinux:latest

RUN pacman -Sy --noconfirm openssh && \
    ssh-keygen -A && \
    sed -i -e 's/^#*PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config && \
    sed -i -e 's/^#*PasswordAuthenication.*/PasswordAuthentication no/' /etc/ssh/sshd_config && \
    sed -i -e 's/^#*PubkeyAuthenication.*/PubkeyAuthenication yes/' /etc/ssh/sshd_config

RUN useradd git && mkhomedir_helper git && pacman -Sy --noconfirm git

ENTRYPOINT ["/usr/bin/sshd","-D"]
