# rfkill unblock all
bluetoothctl remove 14:0A:29:22:90:22
bluetoothctl scan on
sleep 5
bluetoothctl pair 14:0A:29:22:90:22
bluetoothctl connect 14:0A:29:22:90:22
bluetoothctl scan off
