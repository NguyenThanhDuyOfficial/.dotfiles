import Quickshell
import "modules/sidebar"
import "modules/dashboard"
import "modules/timer"

ShellRoot {
  id: root

  Sidebar {}
  
  Timer {}
  // Dashboard {} // LazyLoad
  //

  //Service
}
