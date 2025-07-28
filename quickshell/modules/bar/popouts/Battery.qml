pragma ComponentBehavior: Bound

import qs.widgets
import qs.services
import qs.config
import Quickshell.Services.UPower
import QtQuick

Column {
  id: root

  spacing: Appearance.spacing.normal

  StyledText {
    text: UPower.displayDevice.isLaptopBattery ? qsTr("Remaining: %1%").arg(Math.round(UPower.displayDevice.percentage * 100)) : qsTr("No battery detected")
  }

  StyledText {
    function formatSeconds(s: int, fallback: string): string {
      const day = Math.floor(s / 86400);
      const hr = Math.floor(s / 3600) % 60;
      const min = Math.floor(s / 60) % 60;

      let comps = [];
      if (day > 0)
      comps.push(`${day} days`);
      if (hr > 0)
      comps.push(`${hr} hours`);
      if (min > 0)
      comps.push(`${min} mins`);

      return comps.join(", ") || fallback;
    }

    text: qsTr("Time %1: %2")
            .arg(UPower.onBattery ? "remaining"
                                  : "until charged")
                                      .arg(UPower.onBattery ? formatSeconds(UPower.displayDevice.timeToEmpty, "Calculating...")
                                                            : formatSeconds(UPower.displayDevice.timeToFull, "Fully charged!"))
  }
}
