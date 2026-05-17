import QtQuick
import Quickshell
import QtQuick.Layouts
import Quickshell.Io
import Qt.labs.platform

import qs.services
import qs.components

LazyLoader {
  id: loader
  loading: true

  PanelWindow {
    id: root
    aboveWindows: false
    exclusionMode: ExclusionMode.Ignore
    color: "transparent"
    visible: true
    implicitWidth: 1000
    implicitHeight: 560




    GridLayout {
      id: layout

      anchors.fill: parent
      columns: 4
      rows: 3
      rowSpacing: 8
      columnSpacing: 8



      Rectangle {
        Layout.columnSpan: 4
        Layout.fillWidth: true
        Layout.preferredHeight: 48
        radius: 12
        color: Theme.base

        Text {
          anchors.left: parent.left
          anchors.verticalCenter: parent.verticalCenter
          leftPadding: 16

          font.pointSize: Theme.pointSize
          color: Theme.text

          text: Qt.formatDateTime(ClockSingleton.date, "dddd, MMMM d, yyyy")
        }
      }

      Rectangle {
        Layout.rowSpan: 2
        Layout.preferredWidth: 240
        Layout.fillHeight: true
        radius: 12
        color: Theme.base

        Weather {}

      }
      Rectangle {
        Layout.columnSpan: 3
        Layout.fillWidth: true
        Layout.fillHeight: true
        radius: 12
        color: Theme.base
        
        Quote {}
      }

      Rectangle {
        Layout.preferredWidth: 120
        Layout.preferredHeight: 160
        radius: 12
        color: Theme.base

        Music {}
      }

      Rectangle {
        Layout.fillWidth: true
        Layout.preferredHeight: 160
        color: Theme.blue
      }


    }


// Component.onCompleted: {
//   console.log("Parsed weather:", JSON.parse(weatherFile.text()).current_condition[0].cloudcover)
// }


  }
}
