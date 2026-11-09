#!/usr/bin/env bash

links=$(find symlink-lab/ -type l)


for link in "$links"; do

    if [[ ! -e "$link" ]]; then
        links_to=$(readlink "$link")
        printf "%s -> %s\n" "$link" "$links_to"
    fi
done


