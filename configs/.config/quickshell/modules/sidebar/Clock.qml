import QtQuick

Rectangle {
  id: root
  width: 28
  implicitHeight: layout.implicitHeight + 9
  radius: 8
  color: "#414559"

  Column  {
    id: layout
    anchors.centerIn: parent
    Text {
      id: clockText
      text: Qt.formatTime(new Date(), "hh\nmm")
      font.family: "CaskaydiaCove NFM"
      font.pointSize: 12
      color: "#c6d0f5"
    }
  }


  Timer {
      interval: 1000
      running: true
      repeat: true
      onTriggered: {
          clockText.text = Qt.formatTime(new Date(), "hh\nmm")
      }
  }
}
