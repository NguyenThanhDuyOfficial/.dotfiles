pragma Singleton

import Quickshell
import Quickshell.Io

Singleton {
    id: root

    property alias theme: adapter.theme

    FileView {
      path: Qt.resolvedUrl("config.json")
      watchChanges: true
      onFileChanged: reload()
      JsonAdapter {
        id: adapter

        property QuickshellTheme theme: QuickshellTheme {}
      }
    }
}
