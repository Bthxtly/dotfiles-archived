import qs.widgets
import qs.services
import qs.utils
import qs.config
import Quickshell
import QtQuick
import QtQuick.Layouts

Item {
    id: root

    required property int index
    required property var occupied
    required property int groupOffset

    readonly property bool isWorkspace: true // Flag for finding workspace children
    // Unanimated prop for others to use as reference
    readonly property real size: childrenRect.height

    readonly property int ws: groupOffset + index + 1
    readonly property bool isOccupied: occupied[ws] ?? false
    readonly property bool isActive: Hyprland.activeWsId === root.ws 

    Layout.preferredWidth: childrenRect.width
    Layout.preferredHeight: size

    StyledText {
        id: indicator

        animate: true
        text: root.isOccupied || root.isActive ? Config.bar.workspaces.wsIcon[root.ws-1] : ""
        color: Colours.palette.m3onSurface
        horizontalAlignment: StyledText.AlignHCenter
        verticalAlignment: StyledText.AlignVCenter

        width: Config.bar.sizes.innerHeight
        height: root.isOccupied || root.isActive ? Config.bar.sizes.innerHeight : 0
    }

    Behavior on Layout.preferredWidth {
        Anim {}
    }

    Behavior on Layout.preferredHeight {
        Anim {}
    }

    component Anim: NumberAnimation {
        duration: Appearance.anim.durations.normal
        easing.type: Easing.BezierSpline
        easing.bezierCurve: Appearance.anim.curves.standard
    }
}
