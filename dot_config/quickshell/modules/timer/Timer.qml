import QtQuick
import Quickshell
import Quickshell.Hyprland

import qs.services

Item {
  LazyLoader {
    id: loader
    loading: true

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
        border.color: Theme.mauve
        radius: 4
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
        id: timer
        interval: 1000
        repeat: true
        running: true
        onTriggered: sec++
      }
      GlobalShortcut {
        name: "timer_stop"
        onPressed:  timer.running = false
      }
      GlobalShortcut {
        name: "timer_run"
        onPressed:  timer.running = true
      }
    }
  }

  GlobalShortcut {
    name:"timer_close" 
    onPressed: loader.active = false
  }
  GlobalShortcut {
    name: "timer_open"
    onPressed: loader.active = true
  }
  GlobalShortcut {
    name: "timer_toggle"
    onPressed: loader.active = !loader.active
  }

}
