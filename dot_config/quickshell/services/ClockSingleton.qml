pragma Singleton
import QtQuick
import Quickshell

Singleton {
  SystemClock {
    id: systemClock
    precision: SystemClock.Minutes
  }
  
  readonly property date date: systemClock.date
}
