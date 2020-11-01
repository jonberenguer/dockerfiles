FROM archlinux/base:latest

RUN curl -o /etc/pacman.d/mirrorlist "https://www.archlinux.org/mirrorlist/?country=TW&protocol=https&protocol=http&use_mirror_status=on" && sed -i 's/^#Server/Server/g' /etc/pacman.d/mirrorlist

RUN pacman -Sy --noconfirm sudo &&     useradd -m -u 1000 cuser &&     echo "cuser ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/cuser &&     chmod 0440 /etc/sudoers.d/cuser

RUN su - cuser -c "sudo pacman -Sy --noconfirm --needed git base-devel &&     git clone https://aur.archlinux.org/yay.git &&     cd yay && makepkg -si --noconfirm "

RUN su - cuser -c "yay -Su --noconfirm azure-cli"

WORKDIR /home/cuser
USER cuser

ENTRYPOINT ["/usr/sbin/az"]
