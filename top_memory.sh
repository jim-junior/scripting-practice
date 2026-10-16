#!/usr/bin/env bash

ps -eo pid,comm,rss | sort -k3,3nr | head -n 5
