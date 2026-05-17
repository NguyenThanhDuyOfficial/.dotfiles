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


  }
}
