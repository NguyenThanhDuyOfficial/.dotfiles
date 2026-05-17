import QtQuick
import Quickshell
import QtQuick.Layouts
import Quickshell.Services.Mpris
import Quickshell.Widgets

import qs.services

ColumnLayout {
  id: root
  property MprisPlayer player: Mpris.players.values[0]
  
  anchors.fill: parent

  Loader {
    Layout.alignment: Qt.AlignHCenter
    Layout.topMargin: 8
    Layout.preferredHeight: 100
    Layout.preferredWidth: 100
    sourceComponent: root.player?.trackArtUrl ? imageComponent : textComponent

    Component { id: imageComponent
      ClippingWrapperRectangle {
        radius: 10

        Image {
          id: image
          width: 100
          height: 100
          source: root.player.trackArtUrl
        }
      }
    }

    Component {
      id: textComponent

      Text {
        topPadding: 16
        font.family: Theme.family
        font.pointSize: 15
        color: Theme.text
        wrapMode: Text.WordWrap
        horizontalAlignment: Text.AlignHCenter | Text.AlignVCenter
        text: root.player.trackTitle
      }
    }
  }

  RowLayout {
    Layout.fillHeight: true
    Layout.alignment: Qt.AlignHCenter
    Layout.bottomMargin: 8
    spacing: 4
    
    Rectangle {
      id: prevButton
      Layout.preferredWidth: 24
      Layout.preferredHeight: 24
      radius: 4
      color: "transparent"
      Text {
        anchors.centerIn: parent
        font.family: Theme.family
        font.pointSize: 18
        color: Theme.text
        text: "󰒮"
      }
      MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onEntered: prevButton.color = Theme.selectionBg
        onExited: prevButton.color = "transparent"
        onPressed: prevButton.color = Theme.surface1
        onClicked: root.player.previous()
      }
    }
    Rectangle {
      id: playButton
      Layout.preferredWidth: 24
      Layout.preferredHeight: 24
      radius: 4
      color: "transparent"
      Text {
        anchors.centerIn: parent
        font.family: Theme.family
        font.pointSize: 18
        color: Theme.text
        text: "󰐊"
      }
      MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onEntered: playButton.color = Theme.selectionBg
        onExited: playButton.color = "transparent"
        onPressed: playButton.color = Theme.surface1
        onClicked: root.player.togglePlaying()
      }
    }
    Rectangle {
      id: nextButton
      Layout.preferredWidth: 24
      Layout.preferredHeight: 24
      radius: 4
      color: "transparent"
      Text {
        anchors.centerIn: parent
        font.family: Theme.family
        font.pointSize: 18
        color: Theme.text
        text: "󰒭"
      }
      MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onEntered: nextButton.color = Theme.selectionBg
        onExited: nextButton.color = "transparent"
        onPressed: nextButton.color = Theme.surface1
        onClicked: root.player.next()
      }
    }
  }
}
