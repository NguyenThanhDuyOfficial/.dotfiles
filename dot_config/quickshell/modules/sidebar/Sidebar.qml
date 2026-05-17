import Quickshell
import QtQuick
import QtQuick.Layouts
import Quickshell.Io

import qs.components
import qs.services

Variants {


  model: Quickshell.screens

  delegate: PanelWindow {
    id: root
    required property var modelData
    screen: modelData

    anchors {
      top: true
      left: true
      bottom: true
    }
    color: Theme.base
    implicitWidth: 40

    Workspaces { 
      anchors.top: parent.top
      anchors.horizontalCenter: parent.horizontalCenter
    }

    Clock {
      anchors.centerIn: parent
    }
    PopupWindow {
      id: popupVolume
      anchor.window: root
      anchor.rect.x: parentWindow.width + 8
      anchor.rect.y: parentWindow.height/2-height/2
      implicitWidth: 40
      implicitHeight: 160
      color: "transparent"
      visible: true
      PopupVolume {}
    }
    IpcHandler {
      target: "popupVolume"
      function toggleVolume(){popupVolume.visible = !popupVolume.visible}
    }
  }
}
