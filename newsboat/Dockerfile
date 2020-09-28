FROM archlinux/base:latest

RUN pacman -Sy --noconfirm newsboat

RUN useradd newsboat

WORKDIR /home/newsboat
USER newsboat

ENTRYPOINT ["/usr/bin/newsboat"]
