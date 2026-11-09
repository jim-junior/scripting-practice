#!/usr/bin/env bash

if [[ ! "$1" =~ ^[0-9]+$s ]]; then
    echo "Argument must be a number"
    exit 1
fi


mbval=$(( "$1" * 1000 ))

ps -e -o pid,comm,rss | awk  -v LIMIT="$mbval" 'NR == 1 || $3 >= LIMIT {print $0}'
