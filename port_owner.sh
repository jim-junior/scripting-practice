#!/usr/bin/env bash

if [[ "$#" -ne 1 ]]; then
   echo "Only one argument required" >&2
   exit 1
fi

if [[ ! "$1" =~ ^[0-9]+$ ]]; then
   echo "NUmeric port required" >&2
   exit 1
fi

port="sport = :$1"

pid=$(sudo ss -tnlpH "$port" | awk 'NR == 1 {print $6}' | awk -F":" '{print $2}' | sed -n 's/.*pid=\([0-9]\+\).*/\1/p')

command=$(sudo ss -tnlpH "$port" | awk 'NR == 1 {print $6}' | awk -F":" '{print $2}' | sed -E 's/.*"([^"]+)".*/\1/')

echo "Process: $command"
echo "PID: $pid"

