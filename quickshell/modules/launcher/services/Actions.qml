pragma Singleton

import ".."
import qs.services
import qs.config
import qs.utils
import Quickshell
import QtQuick

Searcher {
  id: root

  readonly property list<Action> actions: [
    Action {
      name: qsTr("Calculator")
      desc: qsTr("Do simple math equations (powered by Qalc)")
      icon: "calculate"

      function onClicked(list: AppList): void {
        root.autocomplete(list, "calc");
      }
    },
    Action {
      name: qsTr("Wallpaper")
      desc: qsTr("Change the current wallpaper")
      icon: "image"

      function onClicked(list: AppList): void {
        root.autocomplete(list, "wallpaper");
      }
    },
    Action {
      name: qsTr("Switch")
      desc: qsTr("Switch system theme")
      icon: "brightness_4"

      function onClicked(list: AppList): void {
        list.visibilities.launcher = false;
        Quickshell.execDetached(["/home/bthxtly/.config/hypr/scripts/switcher.sh"]);
      }
    },
    Action {
      name: qsTr("Shutdown")
      desc: qsTr("Shutdown the system")
      icon: "power_settings_new"

      function onClicked(list: AppList): void {
        list.visibilities.launcher = false;
        Quickshell.execDetached(["systemctl", "poweroff"]);
      }
    },
    Action {
      name: qsTr("Reboot")
      desc: qsTr("Reboot the system")
      icon: "cached"

      function onClicked(list: AppList): void {
        list.visibilities.launcher = false;
        Quickshell.execDetached(["systemctl", "reboot"]);
      }
    },
    Action {
      name: qsTr("Logout")
      desc: qsTr("Log out of the current session")
      icon: "exit_to_app"

      function onClicked(list: AppList): void {
        list.visibilities.launcher = false;
        Quickshell.execDetached(["loginctl", "terminate-user", ""]);
      }
    },
    Action {
      name: qsTr("Lock")
      desc: qsTr("Lock the current session")
      icon: "lock"

      function onClicked(list: AppList): void {
        list.visibilities.launcher = false;
        Quickshell.execDetached(["loginctl", "lock-session"]);
      }
    },
    Action {
      name: qsTr("Hibernate")
      desc: qsTr("Hibernate the current session")
      icon: "bedtime"

      function onClicked(list: AppList): void {
        list.visibilities.launcher = false;
        Quickshell.execDetached(["systemctl", "hibernate"]);
      }
    }
  ]

  function transformSearch(search: string): string {
    return search.slice(Config.launcher.actionPrefix.length);
  }

  function autocomplete(list: AppList, text: string): void {
    list.search.text = `${Config.launcher.actionPrefix}${text} `;
  }

  list: actions.filter(a => !a.disabled)
  useFuzzy: Config.launcher.useFuzzy.actions

  component Action: QtObject {
    required property string name
    required property string desc
    required property string icon

    function onClicked(list: AppList): void {
    }
  }
}
