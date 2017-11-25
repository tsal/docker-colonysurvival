FROM quay.io/galexrt/steamcmd:latest

ENV STEAMCMD_PATH="/steamcmd"
ENV STEAMCMD="$STEAMCMD_PATH/steamcmd.sh"

COPY steam.credentials /steam.credentials
RUN $STEAMCMD +runscript /steam.credentials