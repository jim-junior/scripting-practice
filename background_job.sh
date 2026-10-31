#!/usr/bin/env bash


sleep 30 &

pid="$!"

echo "Started process: $pid"

if kill -0 "$pid"; then

  echo "Process is running"
fi

kill -9 "$pid"

wait "$pid"

echo "Process terminated"


