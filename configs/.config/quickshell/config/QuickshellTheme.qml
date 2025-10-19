import Quickshell.Io
import QtQuick

JsonObject {

  property Color color: Color {}

  component Color: QtObject {
    readonly property color base: "#303446"
  }
}
