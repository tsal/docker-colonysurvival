FROM fedora:25
MAINTAINER Michael King <mking@arikel.net>
# based on image from MAINTAINER Alexander Trost <galexrt@googlemail.com> at galexrt/docker-steamcmd

ENV STEAMCMD_PATH="/steamcmd"
ENV STEAMCMD="$STEAMCMD_PATH/steamcmd.sh"

RUN dnf -q upgrade -y && \
    dnf install -y tar glibc.i686 libstdc++.i686 mono-devel && \
    mkdir -p "$STEAMCMD_PATH" && \
    curl -s http://media.steampowered.com/installer/steamcmd_linux.tar.gz | \
    tar xz -C "$STEAMCMD_PATH" && \
    "$STEAMCMD_PATH/steamcmd.sh" +login anonymous +quit && \
    dnf clean all && \
    rm -rf /var/lib/dnf/* \
        /tmp/* \
        /var/tmp/* \
        /usr/share/locale/*

COPY colony-wrapper.sh /steamcmd/colony-wrapper.sh
COPY colony-install.steamcmd /colony-install.steamcmd

ENTRYPOINT ["/steamcmd/colony-wrapper.sh"]