import QtQuick
import Quickshell

import qs.services

PanelWindow {
  anchors {
    top: true
    right: true
  }
  margins {
    top: 8
    right: 8
  }
  implicitWidth: 120
  implicitHeight: 40
  color: "transparent"
  aboveWindows: true
  exclusionMode: ExclusionMode.Ignore

  Rectangle {
    anchors.fill: parent
    color: Theme.surface0
    border.width: 2
    border.color: Theme.blue
    radius: 8
  }

  Text {
    anchors.centerIn: parent
    font.family: Theme.family
    font.pointSize: 16
    color: Theme.text
    text: new Date(sec * 1000).toISOString().substr(11, 8)
  }

  property var sec: 0
  Timer {
    interval: 1000
    repeat: true
    running: true
    triggeredOnStart: true
    onTriggered: sec++
  }

  Component.onCompleted: {
    console.log()
  }
}
