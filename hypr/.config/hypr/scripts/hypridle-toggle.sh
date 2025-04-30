if pgrep -x "hypridle" >/dev/null; then
  hyprctl notify 5 2000 "rgb(00000f)" "Stop Hypridle"
  killall hypridle
else
  hyprctl notify 5 2000 "rgb(ffffff)" "Continue Hypridle"
  hypridle
fi
