#!/usr/bin/env bash

if [[ "$#" == 1 ]]; then
   echo "Only one prot number required" >&2
   exit 1
fi

if [[ "$1" =~ ^[0-9]+$ ]]; then
   echo "Only numeric input required" >&2
   exit 1
fi


port=$((10#$1))

if (( ! port >= 1 && ! port <= 65535 )); then
   echo "prot number out of range" >&2
   exit 1
fi

ss -tlnH | awk '{print $4}' | awk -F":" '{print $2}' | grep "$1"

if [[ "#?" -ne 0 ]]; then
   echo "Port $1 is not listening" >&2
   exit 1
else
   echo "Port $1 is listening" &>2
fi
