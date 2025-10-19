import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland

Rectangle {
  id: root
        Layout.alignment: Qt.AlignVCenter
  implicitWidth: 24
  height: layout.implicitHeight + 16
  radius: 8
  color: "#414559"

  ColumnLayout {
    id: layout
    anchors.centerIn: parent

    Repeater {
      model: ["w","i","s","d","o","m"]

      Text {
        text: modelData
        font.family: "CaskaydiaCove NF"
        font.pointSize: 12
        color: "#c6d0f5"
        font.bold: (index === workspacesActive) ? 1 : 0
        opacity: (index === workspacesActive) ? 1 : (workspacesOccupied[index] ? 0.6 : 0.2)
      }
    }
  }


  readonly property HyprlandMonitor monitor: Hyprland.monitorFor(root.QsWindow.window?.screen)
  property int workspacesActive: monitor?.activeWorkspace?.id - 1
  property list<bool> workspacesOccupied: []

  function updateWorkspaceOccupied() {
    workspacesOccupied = Array.from({ length: 6 }, (_, i) => {
        return Hyprland.workspaces.values.some(ws => ws.id === i + 1);
    });
  }
  Component.onCompleted: {
    updateWorkspaceOccupied()
  }
  Connections {
      target: Hyprland.workspaces
      function onValuesChanged() {
          updateWorkspaceOccupied();
      }
  }
}


