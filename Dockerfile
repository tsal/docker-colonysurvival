FROM quay.io/galexrt/steamcmd:latest

ENV STEAMCMD_PATH="/steamcmd"
ENV STEAMCMD="$STEAMCMD_PATH/steamcmd.sh"

# Needed for Mono
RUN dnf -q upgrade -y && \
    dnf install -y mono-devel
COPY colony-wrapper.sh /steamcmd/colony-wrapper.sh
COPY colony-install.steamcmd /colony-install.steamcmd

ENTRYPOINT ["/steamcmd/colony-wrapper.sh"]