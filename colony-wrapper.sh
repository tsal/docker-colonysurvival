#!/usr/bin/env bash

export STEAM_USER=""

function getUsername {
    echo -n "Steam Username:"
    read STEAM_USER
    echo $STEAM_USER
}

function installColonySurvival {
    sed -i "s/login.*/login ${STEAM_USER}/g" /colony-install.steamcmd
    $STEAMCMD +runscript /colony-install.steamcmd
    if [ $? = 5 ]; then
        echo "Error! You have Steam Guard enabled but did not provide your key or something else went wrong!"
        exit 1
    fi
    exit 0
}

function isFirstRun {
    if [ ! -e /data/.first_run ]; then
      exit 0
    else
      exit 1
    fi
}

if [ isFirstRun ]; then
    getUsername
    installColonySurvival
    touch /data/.first_run
fi


