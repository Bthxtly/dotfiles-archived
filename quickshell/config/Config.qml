pragma Singleton

import qs.utils
import Quickshell
import Quickshell.Io

Singleton {
    id: root

    property alias bar: adapter.bar
    property alias border: adapter.border
    property alias dashboard: adapter.dashboard
    property alias launcher: adapter.launcher
    property alias notifs: adapter.notifs
    property alias osd: adapter.osd
    property alias session: adapter.session
    property alias winfo: adapter.winfo
    property alias lock: adapter.lock
    property alias paths: adapter.paths

    JsonAdapter {
        id: adapter

        property BarConfig bar: BarConfig {}
        property BorderConfig border: BorderConfig {}
        property DashboardConfig dashboard: DashboardConfig {}
        property LauncherConfig launcher: LauncherConfig {}
        property NotifsConfig notifs: NotifsConfig {}
        property OsdConfig osd: OsdConfig {}
        property SessionConfig session: SessionConfig {}
        property WInfoConfig winfo: WInfoConfig {}
        property LockConfig lock: LockConfig {}
        property UserPaths paths: UserPaths {}
    }
}
