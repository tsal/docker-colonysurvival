#!/usr/bin/env bash

function installColonySurvival {
    $STEAMCMD +runscript /colony-install.steamcmd
    if [ $? = 5 ]; then
        echo "Error! You have Steam Guard enabled but did not provide your key or something else went wrong!"
        exit 1
    fi
    exit 0
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
    echo "Pass"
}

if [ isFirstRun ]; then
    getUsername
    installColonySurvival
    runFix || true # assume it's already been run
    touch /data/.first_run
fi

runServer
