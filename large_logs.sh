#!/usr/bin/env bash
set -e

files=$(find logs -name "*.log")

for file in $files; do
    bytes=$(stat "$file" | awk 'NR==2 {print $2}')
    if [[ $bytes -gt 1000000 ]]; then
        echo "$file"
    fi
done
