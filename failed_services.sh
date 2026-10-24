#!/usr/bin/env bash

awk '$3 == "failed" {print $1}' services.txt | cut -d '.' -f 1
