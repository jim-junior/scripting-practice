#!/usr/bin/env bash

procs=$(ps -eo comm | tail +2 | sort | uniq -c | sort -nr)

top_proc=$(echo "$procs" | head -1 | awk '{print $1}')

# safegaurd for arithmetic operation below, incase of unexpected error
if [[ ! "$top_proc" =~ ^[0-9]+$ ]]; then
   echo "Error geting top process count: not numeric" >&2
   exit 1
fi

if (( top_proc <= 1 )); then
   echo "No duplicate processes" >&2
   exit 1
fi

cat <<< "$procs"
