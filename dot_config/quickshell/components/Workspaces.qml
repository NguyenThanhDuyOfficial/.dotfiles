import QtQuick
import Quickshell
import QtQuick.Layouts
import Quickshell.Io
import Quickshell.Hyprland

import qs.services


Rectangle {
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
        color: (index+1==Hyprland.focusedWorkspace.id) ? Theme.mauve : Theme.text
        font.family: Theme.family
        font.pointSize: 14
        font.weight: (index+1==Hyprland.focusedWorkspace.id) ? 800 : 400
        text: modelData
        opacity: (index+1==Hyprland.focusedWorkspace.id) ? 1 : 0.7
      }

    }
  }
}
