FROM quay.io/galexrt/steamcmd:latest

ENV STEAMCMD_PATH="/steamcmd"
ENV STEAMCMD="$STEAMCMD_PATH/steamcmd.sh"

RUN $STEAMCMD +login anonymous +force_install_dir /data +app_update 366090 +quit