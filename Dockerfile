FROM quay.io/galexrt/steamcmd:latest

ENV STEAMCMD_PATH="/steamcmd"
ENV STEAMCMD="$STEAMCMD_PATH/steamcmd.sh"
ENV WRAPPER="$STEAMCMD_PATH/colony-wrapper.sh"

COPY colony-wrapper.sh /steamcmd/colony-wrapper.sh
COPY colony-install.steamcmd /colony-install.steamcmd

ENTRYPOINT ["$WRAPPER"]