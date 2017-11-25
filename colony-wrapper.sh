#!/usr/bin/env bash

export SCRIPT_ARGS=$@
# TODO: remove when anonymous install works
export STEAM_USER

function installColonySurvival {
    # TODO: remove when anonymous install works
    sed -i "s/login.*/login ${STEAM_USER}/g" /colony-install.steamcmd
    sed -i "s/@NoPromptForPassword 1/@NoPromptForPassword 0/g" /colony-install.steamcmd
    # TODO: end of removal section
    $STEAMCMD +runscript /colony-install.steamcmd
}

function runFix {
    cp ${STEAMCMD_PATH}/linux64/steamclient.so /data/colonyserver_Data/Plugins/x86_64/
}

function isFirstRun {
    if [ ! -e /data/.first_run ]; then
      exit 0
    else
      exit 1
    fi
}

function runServer {
    echo "Starting Server with arguments: ${SCRIPT_ARGS}"
    cd /data/
    mono colonyserverdedicated.exe ${SCRIPT_ARGS}
}

# TODO: remove when anonymous install works
function getUserName {
    echo -n "Steam Username:"
    read STEAM_USER
}

if [ isFirstRun ]; then
    echo "First run detected, so we'll need information; command line arguments will be preserved by docker."
    # TODO: remove when anonymous install works
    getUserName
    installColonySurvival
    touch /data/.first_run
fi

runFix
runServer