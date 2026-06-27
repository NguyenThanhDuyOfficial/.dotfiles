import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Widgets
import Quickshell.Networking

import qs.services

Rectangle {
  id: root

  property var panelWindow: null
  property bool isHovered: false

  Component.onCompleted: {
    Networking.devices.values.forEach(function(device){

      if (DeviceType.toString(device.type) === "Wifi"){
        var wifiDevice = device
        // console.log(wifiDevice.scannerEnabled)
        wifiDevice.scannerEnabled = true
      }
    })
  }

  Behavior on color {
    ColorAnimation { duration: 150 }
  }

  MouseArea {
      id: mouseArea
      anchors.fill: parent
      hoverEnabled: true
      
      onEntered: root.isHovered = true
      onExited: root.isHovered = false
  }
  
  // PopupWindow {
  //   id: popupWindow
  //   anchor.window: panelWindow
  //   anchor.rect.x: panelWindow.width + 8
  //   anchor.rect.y: (panelWindow.height - popupWindow.implicitHeight)/2
  //   implicitWidth: 400
  //   implicitHeight: 720
  //   color: "transparent"
  //   visible: false
  //
  //   Rectangle {
  //     anchors.fill: parent
  //     color: Theme.base
  //     radius: 16
  //   }
  //   ColumnLayout {
  //     anchors.fill:parent
  //
  //     RowLayout {
  //       Layout.alignment: Qt.AlignCenter
  //       Text {
  //         text: "icon"
  //       }
  //       ColumnLayout {
  //         Text {
  //           text: "Hong Hunh"
  //         }
  //         Text {
  //           text: "connection"
  //         }
  //       }
  //       Text {
  //         text: "icon"
  //       }
  //     }
  //     RowLayout {
  //       Layout.alignment: Qt.AlignBottom | Qt.AlignHCenter
  //       Layout.bottomMargin: 8
  //       Layout.fillWidth: true
  //       Layout.preferredWidth: 400
  //
  //       RowLayout {
  //         Rectangle {
  //           Layout.alignment: Qt.AlignLeft
  //           implicitWidth: 28
  //           implicitHeight: 28
  //           radius: 8
  //           color: "transparent"
  //
  //           MouseArea {
  //             anchors.fill: parent
  //             hoverEnabled: true
  //             onEntered: {parent.color = Theme.surface0}
  //             onExited: {parent.color = "transparent"}
  //           }
  //           Text {
  //             anchors.centerIn: parent
  //             font.family: Theme.familyMono
  //             color: Theme.text
  //             font.pixelSize: 32
  //             text: ""
  //           }
  //         }
  //         Text {
  //           verticalAlignment: Text.AlignVCenter
  //           font.pixelSize: 20
  //           color: Theme.text
  //           text: "Wi-Fi"
  //         }
  //       }
  //
  //       Rectangle {
  //         implicitWidth: 36
  //         implicitHeight: 28
  //         color: Theme.green
  //         radius: 8
  //
  //         Text {
  //           anchors.centerIn: parent
  //           font.pixelSize: 16
  //           font.weight: 500
  //           color: Theme.base
  //           text: "ON"
  //         }
  //       }
  //
  //       RowLayout {
  //         Layout.alignment: Qt.AlignRight
  //
  //         Text {
  //           text: "qr"
  //         }
  //         Text {
  //           text: "seting"
  //         }
  //       }
  //     }
  //   }
  // }

  anchors.bottomMargin: 24
  implicitWidth: 28
  implicitHeight: 28
  radius: 8
  color: isHovered ? Theme.surface0 : "transparent"

  Text {
    anchors.centerIn: parent
    font.family: Theme.familyMono
    color: Theme.text
    font.pointSize: 24
    text: "󰖩"
  }
}
