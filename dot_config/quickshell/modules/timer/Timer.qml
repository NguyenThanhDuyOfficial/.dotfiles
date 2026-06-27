import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland
import Quickshell.Services.Notifications

import qs.services

Item {
  id: root

  property var taskMins: 0
  property var taskSecs: taskMins * 60
  property var sessionMins: 4 * 60
  property var sessionSecs: sessionMins * 60

  property bool isRunning: false

  function onTimerTriggered(){
    if (taskSecs > 0)
    {
      taskSecs--
    }
    else {
      handlePhaseCompleted()
    }
  }
  function handlePhaseCompleted(){
    sendNotification("Done")
  }

  function sendNotification(summary) {
    Quickshell.execDetached(["notify-send", summary])
  }

  Timer {
    id: timer
    interval: 1000
    repeat: true
    running: isRunning
    onTriggered: onTimerTriggered()
  }

  GlobalShortcut {
    name:"timer_close" 
    onPressed:{ loader.active = false
    timer.running = false}
  }
  GlobalShortcut {
    name: "timer_open"
    onPressed: loader.active = true
  }
  GlobalShortcut {
    name: "timer_toggle"
    onPressed: loader.active = !loader.active
  }
  GlobalShortcut {
    name: "timer_stop"
    onPressed:  timer.running = false
  }
  GlobalShortcut {
    name: "timer_run"
    onPressed:  timer.running = true
  }


  // FRONTEND
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
      implicitWidth: layout.implicitWidth + 32
      implicitHeight: layout.implicitHeight + 16
      color: "transparent"
      aboveWindows: true
      exclusionMode: ExclusionMode.Ignore
      
      Rectangle {
        anchors.fill: parent
        color: Theme.surface0
        border.width: 2
        border.color: Theme.mauve
        radius: 16
      }

      RowLayout {
        id: layout
        anchors.centerIn: parent
        spacing: 32
        Text {
          text: Qt.formatDateTime(new Date(sessionSecs * 1000).toISOString(), "hh:mm")
          font.family: Theme.family
          font.pixelSize: 20
          color: Theme.text

          MouseArea {
            anchors.fill: parent
            onWheel: (wheel) => {
              if (wheel.angleDelta.y > 0) {
                if (sessionMins >= 11*60){
                  return
                }
                sessionMins += 60
              }

              else if (wheel.angleDelta.y < 0) {
                if (sessionMins <= 60) {
                  return 
                }
                sessionMins -= 60
              }
            }
          }
        }
        
        Text {
          font.family: Theme.familyMono
          font.pixelSize: 24
          color: Theme.text
          text: isRunning ? "" : ""

          MouseArea {
            anchors.fill: parent

            onPressed: {
              if (isRunning) {
                isRunning = false
              } else {
                isRunning = true
              }
            }
          }
        }

        Text {
          text: Qt.formatDateTime(new Date(taskSecs*1000).toISOString(), "mm:ss")
          font.family: Theme.family
          font.pixelSize: 20
          color: Theme.text

          MouseArea {
            anchors.fill: parent
            onWheel: (wheel) => {
              if (wheel.angleDelta.y > 0) {
                if (taskMins >= 55){
                  return
                }
                taskMins += 5
                sessionMins -= 5
              }

              else if (wheel.angleDelta.y < 0) {
                if (taskMins <= 5) {
                  return 
                }
                taskMins -= 5
                sessionMins += 5
              }
            }
          }
        }
      }
    }
  }
}
