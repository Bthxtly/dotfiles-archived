#!/bin/env bash

# record the whole screen if no parameter, or record region if has the "--region" argument

if [[ "$1" == "--region" ]]; then
  region=$(slurp)
  if [[ "$region" == "" ]]; then
    exit
  fi
fi

pgrep -x "wf-recorder" && pkill -INT -x wf-recorder && notify-send -h string:wf-recorder:record -t 1000 "Finished Recording" && exit 0

notify-send -h string:wf-recorder:record -t 1000 "Recording in:" "3"
sleep 1
notify-send -h string:wf-recorder:record -t 1000 "Recording in:" "2"
sleep 1
notify-send -h string:wf-recorder:record -t 950 "Recording in:" "1"
sleep 1

dateTime=$(date +%m-%d-%Y-%H:%M:%S)
path="$HOME/Videos/Screenshots/$dateTime.mp4"

if [[ "$region" ]]; then
  wf-recorder -g "$region" --bframes max_b_frames -f $path
else
  wf-recorder --bframes max_b_frames -f $path
fi
