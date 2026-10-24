#!/usr/bin/env bash

set -exo pipefail

if [[ ! "$#" -ge 1  ]]; then
    echo "Error: Missing username"
    echo "Usage: $0 <username>"
    exit 1
fi

processes=$(ps -u "$1" -o pid,cmd | sort -n)
total=$(tail -n +2 < "$processes" | wc -l)

cat <<EOF
$processes

$total
EOF
