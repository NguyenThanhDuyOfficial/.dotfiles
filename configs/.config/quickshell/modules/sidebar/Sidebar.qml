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
      anchors.fill: parent

      ColumnLayout {
        Layout.alignment: Qt.AlignTop | Qt.AlignHCenter

        Workspaces {}
      }

      ColumnLayout {
        Layout.alignment: Qt.AlignCenter

        Clock {}
      }

      ColumnLayout {
        Layout.alignment: Qt.AlignBottom | Qt.AlignHCenter

        Workspaces {}
      }
    }
  }
}
