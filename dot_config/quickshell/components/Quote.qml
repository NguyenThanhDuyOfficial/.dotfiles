import QtQuick
import Quickshell
import QtQuick.Layouts
import Quickshell.Io

import qs.services

ColumnLayout {
  id: root
  anchors.centerIn: parent
  spacing: 36

  property var quoteData: JSON.parse(quoteFile.text())
  FileView {
    id: quoteFile
    path: Quickshell.shellDir + "/cache/quote.json"
    blockLoading: true
  }

  Text {
    Layout.maximumWidth: 600
    Layout.alignment: Qt.AlignHCenter
    font.family: Theme.family
    font.pointSize: 15
    color: Theme.text
    horizontalAlignment: Text.AlignHCenter
    wrapMode: Text.WordWrap
    text: root.quoteData[0].q
  }
  Text {
    Layout.minimumWidth: 600
    Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
    font.family: Theme.family
    font.pointSize: 15
    color: Theme.text
    horizontalAlignment: Text.AlignRight
    text: "- " + root.quoteData[0].a
  }
}
