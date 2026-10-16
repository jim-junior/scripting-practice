#!/usr/bin/env bash

awk '$6 ~ /^Failed/ {print $11}' auth.log | sort | uniq -c | sort -n | awk '$1 >= 2 {print $0}'
