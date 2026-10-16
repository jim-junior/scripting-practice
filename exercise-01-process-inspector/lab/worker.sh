#!/usr/bin/env bash

set -u

LAB_DIR="$1"

# Open a normal file descriptor.
exec 3<>"$LAB_DIR/active-data.txt"

# Open another file descriptor, then delete the file while it
# is still open.
exec 4<>"$LAB_DIR/deleted-data.txt"
rm "$LAB_DIR/deleted-data.txt"

# Spawn a child process.
sleep 100000 &
child_pid=$!

# Keep this Bash process alive while waiting for its child.
wait "$child_pid"
