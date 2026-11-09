#!/usr/bin/env bash

TEMPFILE=$(mktemp)

printf "Created temporary file: %s\n" "$TEMPFILE"

trap 'rm -f $TEMPFILE' EXIT

date

hostname


