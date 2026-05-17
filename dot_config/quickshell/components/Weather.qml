import QtQuick
import Quickshell
import QtQuick.Layouts
import Quickshell.Io

import qs.services

ColumnLayout {
  id: root
  anchors.fill: parent

  readonly property var weatherIconMap: {
    "113": "",
    "119": "",
    "116": "",
    "143": "",
    "302": "",
    "389": "󰙾",
    "305": "",
    "314": "",
    "362": "",
    "374": "",
    "392": "",
    "371": "",
    "266": "",
    "200": "",
    "176": "",
    "386": "",
    "281": "",
    "377": "",
    "284": "",
    "320": "",
    "368": "",
    "365": "",
    "293": "",
    "299": "",
    "185": "",
    "263": "",
    "329": "",
    "230": "",
  }
  property var weatherData: JSON.parse(weatherFile.text())
  FileView {
    id: weatherFile
    path: Quickshell.shellDir + "/cache/weather.json"
    blockLoading: true
  }

  ColumnLayout {
    Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
    Layout.topMargin: 32
    Text {
      Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
      font.family: Theme.family
      font.pointSize: 90
      color: Theme.text
      text: root.weatherIconMap[root.weatherData.current_condition[0].weatherCode]  
    }
    Text {
      Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
      font.family: Theme.family
      font.pointSize: 18
      font.weight: 900
      color: Theme.text
      text: root.weatherData.current_condition[0].weatherDesc[0].value
    }
  }
  ColumnLayout {
    Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
    Text {
      Layout.alignment: Qt.AlignLeft
      font.family: Theme.family
      font.pointSize: 18
      color: Theme.text
      text: "󰔄 : " + root.weatherData.current_condition[0].temp_C
    }
    Text {
      Layout.alignment: Qt.AlignLeft
      font.family: Theme.family
      font.pointSize: 18
      color: Theme.text
      text: " : " + root.weatherData.current_condition[0].precipMM
    }
    Text {
      Layout.alignment: Qt.AlignLeft
      font.family: Theme.family
      font.pointSize: 18
      color: Theme.text
      text: "󱁝 : " + root.weatherData.current_condition[0].uvIndex
    }
    Text {
      Layout.alignment: Qt.AlignLeft
      font.family: Theme.family
      font.pointSize: 18
      color: Theme.text
      text: " : " + root.weatherData.current_condition[0].windspeedKmph
    }
    Text {
      Layout.alignment: Qt.AlignLeft
      font.family: Theme.family
      font.pointSize: 18
      color: Theme.text
      text: " : " + root.weatherData.current_condition[0].cloudcover
    }
    Text {
      Layout.alignment: Qt.AlignLeft
      font.family: Theme.family
      font.pointSize: 18
      color: Theme.text
      text: " : " + root.weatherData.current_condition[0].humidity
    }
  }

}
