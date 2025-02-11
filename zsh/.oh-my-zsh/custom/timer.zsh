countdown() {
  clear
  start="$(($(date '+%s') + $1))"
  while [ $start -ge $(date +%s) ]; do
    time="$(($start - $(date +%s)))"
    printf '%s\r' "$(date -u -d "@$time" +%H:%M:%S)"
    sleep 0.1
  done

  while true; do
    echo "\a"
  done
}

stopwatch() {
  clear
  start=$(date +%s)
  while true; do
    time="$(($(date +%s) - $start))"
    printf '%s\r' "$(date -u -d "@$time" +%H:%M:%S)"
    sleep 0.1
  done
}

# timetotal() {
#   for i in $(seq 20); do { time $1; } 2>&1 | grep -o '[0-9.]* total' | cut -d' ' -f1 | awk '{printf "finish in %.0f ms\n", $1 * 1000}'; done
# }
# vim:set ft=sh:
