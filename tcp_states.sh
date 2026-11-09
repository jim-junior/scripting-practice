#!/usr/bin/env bash

awk '{print $1}' connections.txt | tail -n +2 | sort | uniq -c | sort -nr
