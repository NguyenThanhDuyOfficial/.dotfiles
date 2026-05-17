import QtQuick
import Quickshell
import Quickshell.Services.Pipewire

import qs.services

Rectangle {
  property var sink: Pipewire.defaultAudioSink
  property var sinkTracker: PwObjectTracker {
        objects: [Pipewire.defaultAudioSink]
      }

  anchors.fill: parent
  color: Theme.surface0
  radius: 8
  
  Rectangle {
    anchors.centerIn: parent
    implicitWidth: 12
    implicitHeight: 100
    color: Theme.surface1
    Rectangle {
      anchors.bottom: parent.bottom
      implicitWidth: 12
      implicitHeight: Pipewire.defaultAudioSink.audio.volume * 100
      color: Theme.mauve
    }
  }
}
