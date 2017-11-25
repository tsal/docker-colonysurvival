FROM quay.io/galexrt/steamcmd:latest

ENV STEAMCMD_PATH="/steamcmd"
ENV STEAMCMD="$STEAMCMD_PATH/steamcmd.sh"

COPY colony-wrapper.sh /steamcmd/colony-wrapper.sh
COPY colony-install.steamcmd /colony-install.steamcmd

ENTRYPOINT ["/steamcmd/colony-wrapper.sh"]