if [[ "$(tty)" == '/dev/tty1' ]]; then
  if [[ $(lsusb | grep "Genesys Logic, Inc. Billboard Device") ]]; then
    AQ_DRM_DEVICES=/dev/dri/card1:/dev/dri/card2 Hyprland
  else
    Hyprland
  fi
fi
