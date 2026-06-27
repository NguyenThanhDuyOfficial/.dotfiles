import QtQuick
import Quickshell
import QtQuick.Layouts
import Quickshell.Io
import Quickshell.Hyprland

import qs.services


Rectangle {
  id: root

  readonly property var focusedWs: Hyprland.focusedWorkspace.id
  readonly property var occupiedWs: {
      const occ = {};
      for (const ws of Hyprland.workspaces.values)
          occ[ws.id] = true;
      return occ;
  }

  anchors.topMargin: 20
  color: Theme.surface0
  implicitWidth: child.implicitWidth + 8
  implicitHeight: child.implicitHeight + 8
  radius: 8

  ColumnLayout {
    id: child
    anchors.horizontalCenter: parent.horizontalCenter
    Repeater {
      model: ["一","二","三","四","五"]
      Text {
        color: (index+1==root.focusedWs) ? Theme.mauve : Theme.text
        font.family: Theme.family
        font.pointSize: 14
        font.weight: (index+1==root.focusedWs) ? 900 : 400
        text: modelData
        opacity: (index+1==root.focusedWs) ? 1 : ((root.occupiedWs[index+1] ?? false) ? 0.5 : 0.1)
      }
    }
  }
}
