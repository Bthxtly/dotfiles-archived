moveAllWorkspacesToMonitor() {
  TARGET_MONITOR="$1"

  hyprctl workspaces | grep ^workspace | cut --delimiter ' ' --fields 3 | xargs -I '{}' hyprctl dispatch moveworkspacetomonitor '{}' "$TARGET_MONITOR"

  # Previous approach
  #hyprctl swapactiveworkspaces $EXTERNAL_MONITOR $INTERNAL_MONITOR
}

# TODO: Detect these instead of hardcoding them
INTERNAL_MONITOR="eDP-1"
EXTERNAL_MONITOR="DP-1"

# {
#   IFS= read -r INTERNAL_MONITOR
#   IFS= read -r EXTERNAL_MONITOR
# } < <(hyprctl monitors all | grep ID | cut --delimiter ' ' --fields 2)
# echo $INTERNAL_MONITOR
# echo $EXTERNAL_MONITOR

NUM_MONITORS=$(hyprctl monitors all | grep --count Monitor)
NUM_MONITORS_ACTIVE=$(hyprctl monitors | grep --count Monitor)

# For initial startup if you use hyprland's default monitor settings:
# Turn off the laptop monitor if it + another monitor is active
if [ "$NUM_MONITORS_ACTIVE" -ge 2 ] && hyprctl monitors | cut --delimiter ' ' --fields 2 | grep --quiet ^$INTERNAL_MONITOR; then
  # Doing this I hopefully end up on workspace 1 on the external monitor rather than 2 at startup
  # move_all_workspaces_to_monitor $EXTERNAL_MONITOR
  hyprctl keyword monitor "$INTERNAL_MONITOR,disable"
  # Alternate fix to ensure I start on workspace 1
  #hyprctl dispatch workspace 1
  exit
fi

# Handle socket events from hyprland socket2
handleEvents() {
  echo $1
  case $1 in
  "monitoradded>>$EXTERNAL_MONITOR")
    moveAllWorkspacesToMonitor "$EXTERNAL_MONITOR"
    hyprctl keyword monitor "$INTERNAL_MONITOR,disable"
    hyprctl keyword monitor "$EXTERNAL_MONITOR,2560x1440@180,0x0,1.25"
    ;;
  "monitorremoved>>$EXTERNAL_MONITOR")
    hyprctl keyword monitor "$INTERNAL_MONITOR,preferred,auto,1.6"
    moveAllWorkspacesToMonitor "$INTERNAL_MONITOR"
    ;;
  *)
    # ignore all other events or use them somehow else
    ;;
  esac
}

# Listen to live events from hyprland socket2 continuously
socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do handleEvents "$line"; done
