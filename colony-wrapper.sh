#!/usr/bin/env bash

function getCredentials {
    echo -n "Steam Username:"
    read STEAM_USER
    echo -n "Steam Password (not stored):"
    read -s STEAM_PASS
    echo -n "Steam Guard Code (empty if not used):"
    read STEAM_GUARD
    echo "${STEAM_USER} ${STEAM_PASS} ${STEAM_GUARD}"
}

function installColonySurvival {
    CREDENTIALS=$(getCredentials)
    sed -i "s/login.*/login ${CREDENTIALS}/g" /colony-install.steamcmd
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
    installColonySurvival
    touch /data/.first_run
fi


