#!/usr/bin/env bash

if [[ "$#" -lt 1 ]]; then
   echo "Not enough arguments"
   exit 1
fi

ps -C "$1" -o pid,comm

if [[ ! "$?" == 0 ]]; then

    echo "No matching processes"
    exit 1
fi
