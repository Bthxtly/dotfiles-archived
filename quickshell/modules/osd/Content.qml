import qs.widgets
import qs.services
import qs.config
import QtQuick

Column {
  id: root

  required property Brightness.Monitor monitor

  padding: Appearance.padding.large

  anchors.verticalCenter: parent.verticalCenter
  anchors.left: parent.left

  spacing: Appearance.spacing.normal

  component Control: StyledRect {
    id: control

    required property string icon
    required property bool canUse
    property int fontSize: Appearance.font.size.extraLarge
    property int padding
    property bool fill: true
    property bool primary
    function onClicked(): void {
    }

    implicitWidth: Math.max(icon.implicitWidth, icon.implicitHeight) + padding * 2
    implicitHeight: implicitWidth

    radius: Appearance.rounding.full
    color: primary && canUse ? Colours.palette.m3primary : "transparent"

    StateLayer {
      disabled: !control.canUse
      radius: parent.radius
      color: control.primary ? Colours.palette.m3onPrimary : Colours.palette.m3onSurface

      function onClicked(): void {
        control.onClicked();
      }
    }

    MaterialIcon {
      id: icon

      anchors.centerIn: parent
      anchors.horizontalCenterOffset: -font.pointSize * 0.02
      anchors.verticalCenterOffset: font.pointSize * 0.02

      animate: true
      fill: control.fill ? 1 : 0
      text: control.icon
      color: control.canUse ? control.primary ? Colours.palette.m3onPrimary : Colours.palette.m3onSurface : Colours.palette.m3outline
      font.pointSize: control.fontSize
    }
  }

  VerticalSlider {
    icon: {
      if (Audio.muted)
      return "no_sound";
      if (value >= 0.5)
      return "volume_up";
      if (value > 0)
      return "volume_down";
      return "volume_mute";
    }
    value: Audio.volume
    onMoved: Audio.setVolume(value)

    implicitWidth: Config.osd.sizes.sliderWidth
    implicitHeight: Config.osd.sizes.sliderHeight
  }

      Control {
        icon: "equalizer"
        canUse: Players.active?.canQuit ?? false
        fontSize: Appearance.font.size.larger
        padding: Appearance.padding.small
        fill: false
        color: Colours.palette.m3surfaceContainer

        function onClicked(): void {
          Hyprland.dispatch("togglespecialworkspace pwvu");
        }
      }

  VerticalSlider {
    icon: `brightness_${(Math.round(value * 2) + 5)}`
    value: root.monitor?.brightness ?? 0
    onMoved: root.monitor?.setBrightness(value)

    implicitWidth: Config.osd.sizes.sliderWidth
    implicitHeight: Config.osd.sizes.sliderHeight
  }
}
