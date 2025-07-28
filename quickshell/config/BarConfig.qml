import Quickshell.Io

JsonObject {
    property bool persistent: true
    property bool showOnHover: true
    property int dragThreshold: 20
    property Workspaces workspaces: Workspaces {}
    property Sizes sizes: Sizes {}

    component Workspaces: JsonObject {
        property int shown: 10
        property bool rounded: true
        property bool activeIndicator: true
        property bool activeTrail: false
        property list<string> wsIcon: ["󰣇", "", "", "󰈹", "", "󰊗", "", "󰐱", "", "󰍳"]
    }

    component Sizes: JsonObject {
        property int innerHeight: 25
        property int windowPreviewSize: 400
        property int trayMenuWidth: 250
        property int batteryWidth: 250
    }
}
