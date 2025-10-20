import QtQuick
import QtQuick.Controls
import Quickshell.Services.Notifications

Rectangle {
  id: root
  implicitWidth: 32
  implicitHeight: 32
  radius: 8
  color: "#414559"

  Rectangle {
    id: background
    anchors.centerIn: parent
    width: 24
    height: width
    radius: width/2
    color: "#414559"

    Text {
      id: statusText
      anchors.centerIn: parent
      text: ""
      font.pointSize: 16
      font.family: "CaskaydiaCove Nerd Font Mono"
      color: "#c6d0f5"
    }

    MouseArea {
      anchors.fill: parent
      onClicked: {
        if (!animation.running && root.progress === 0) animation.start()
        else if (animation.paused) animation.resume()
        else animation.pause()

      }
    }
    Connections {
      target: animation
      function onPausedChanged() {statusText.text = animation.paused ? "" : ""}
    }
  }


  property real progress: 0.0

  Canvas {
    id: circularCanvas
    anchors.fill: parent

    onPaint: {
      const ctx = getContext("2d")
      ctx.beginPath()
      ctx.strokeStyle = "#838ba7"
      ctx.lineWidth = 4
      ctx.arc(width/2, height/2, 12 , 0, 2 * Math.PI)
      ctx.stroke()


      ctx.beginPath()
      ctx.strokeStyle = root.progress >= 0.74 ? "#8caaee" : "#c6d0f5"
      ctx.lineWidth = 4
      ctx.lineCap = "round"
      ctx.arc(width/2, height/2, 12, -Math.PI / 2, (2 * Math.PI * root.progress) - Math.PI / 2)
      ctx.stroke()
    }
    
    Connections {
        target: root
        function onProgressChanged() { circularCanvas.requestPaint() }
    }
  }


  PropertyAnimation {
    id: animation
    target: root
    property: "progress"
      from: 0.0
      to: 1.0
      loops: Animation.Infinite
      duration: 3600000
      easing.type: easing.linear
      running: false
    }

}

