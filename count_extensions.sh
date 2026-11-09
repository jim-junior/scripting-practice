#!/usr/bin/env bash

file_list=$(find artifacts/ -type f -exec basename {} \;)

for filename in $file_list; do
    if [[ "$filename" == *.* ]]; then
    echo "${filename##*.}"
    fi
done | sort | uniq -c | sort -nr



