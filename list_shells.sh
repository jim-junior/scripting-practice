#!/usr/bin/env bash

while IFS=: read -r username password uid gid gecos home shell; do

    printf "%s -> %s\n" "$username" "$shell"

done < /etc/passwd
