import qs.widgets
import qs.services
import qs.config
import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

Item {
  id: root

  required property ShellScreen screen
  required property HyprlandToplevel client

  implicitWidth: child.implicitWidth
  implicitHeight: screen.height * Config.winfo.sizes.heightMult

  RowLayout {
    id: child

    anchors.fill: parent
    anchors.margins: Appearance.padding.large

    spacing: Appearance.spacing.normal

    Preview {
      screen: root.screen
      client: root.client
    }

    StyledRect {
      Layout.fillWidth: true
      Layout.fillHeight: true
      Layout.preferredWidth: Config.winfo.sizes.detailsWidth

      color: Colours.palette.m3surfaceContainer
      radius: Appearance.rounding.normal

      Details {
        client: root.client
      }
    }
  }
}
