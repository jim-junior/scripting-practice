#!/usr/bin/env bash

set -euo pipefail

LAB_DIR="$PWD/exercise-01-process-inspector/lab"

mkdir -p "$LAB_DIR"

cat > "$LAB_DIR/worker.sh" <<'WORKER'
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
WORKER

chmod +x "$LAB_DIR/worker.sh"

nohup "$LAB_DIR/worker.sh" "$LAB_DIR" \
    > "$LAB_DIR/worker.stdout" \
    2> "$LAB_DIR/worker.stderr" &

pid=$!

echo "$pid" > "$LAB_DIR/worker.pid"

sleep 1

echo "Lab process started."
echo "PID: $pid"
echo "PID stored in:"
echo "$LAB_DIR/worker.pid"
