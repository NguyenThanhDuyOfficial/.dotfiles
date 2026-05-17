import QtQuick
import Quickshell

import qs.services

Item {
  id: root

  Text {
    anchors.centerIn: parent
    color: Theme.text
    font.family: Theme.family
    font.pointSize: Theme.pointSize
    font.weight: 900

    text: Qt.formatDateTime(ClockSingleton.date, "hh\nmm")
  }
}
