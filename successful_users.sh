#!/usr/bin/env bash

cat logins.csv | awk -F',' '$3 == "success" {print $2}' | sort -u
