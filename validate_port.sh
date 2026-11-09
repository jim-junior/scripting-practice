#!/usr/bin/env bash

if [[ "$#" -ne 1 ]]; then
   echo "ONly one argument required" >&2
   exit 1
fi

if [[ ! "$1" =~ ^[0-9]+$ ]]; then
   echo "Argument must be numbers" >&2
fi


if [[ "$1" -ge 1 && "$1" -le 65535 ]]; then
   echo "Valid port: $1"
else
   echo "Invalid port" >&2
   exit 1
fi

