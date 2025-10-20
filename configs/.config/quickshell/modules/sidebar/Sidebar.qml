import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.config

Scope {
  PanelWindow {
    anchors {
      top: true
      bottom: true
      left: true
    }

    implicitWidth: 40
    color: "#303446"


    ColumnLayout {
      anchors.horizontalCenter: parent.horizontalCenter
      anchors.top: parent.top

      Workspaces {}
      Pomodoro {}
    }

    ColumnLayout {
      anchors.horizontalCenter: parent.horizontalCenter
      anchors.verticalCenter: parent.verticalCenter

      Clock {}
    }

    ColumnLayout {
      anchors.horizontalCenter: parent.horizontalCenter
      anchors.bottom: parent.bottom
      
      Workspaces {}
    }
  }
}
