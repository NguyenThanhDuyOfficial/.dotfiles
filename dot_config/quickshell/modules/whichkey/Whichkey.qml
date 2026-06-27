import QtQuick
import Quickshell

import qs.services


LazyLoader {
  loading: true

  PanelWindow {
    anchors {
      right: true
      bottom: true
    }
    margins {
      right: 8
      bottom:  8
    }
    implicitWidth: 320
    implicitHeight: 400
    color: "transparent"

    Rectangle {
      anchors.fill: parent
      color: Theme.surface0
      radius: 8
      border.width: 4
      border.color: Theme.mauve
    }


  }

}
