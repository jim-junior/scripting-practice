#!/usr/bin/env bash


find permissions-lab/ -type f -perm /111 -exec stat -c '%a %n' {} +
