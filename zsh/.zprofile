if [[ "$(tty)" == '/dev/tty1' ]]; then
  if [[ $(lsusb | grep "Genesys Logic, Inc. Billboard Device") ]]; then
    AQ_DRM_DEVICES=/dev/dri/card0:/dev/dri/card1 Hyprland
  else
    Hyprland
  fi
fi
