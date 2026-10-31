#!/usr/bin/env bash

mapfile -t services < services.list

echo "Total Services: ${#services[@]}"


for index in "${!services[@]}"; do
    echo "${index}. ${services[$index]}"
done
