/*
* Copyright (c) 2015 Razeware LLC
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
* THE SOFTWARE.
*/

import WatchKit

class TimerController: WKInterfaceController {

  @IBOutlet var container: WKInterfaceGroup!
  @IBOutlet var nameLabel: WKInterfaceLabel!
  @IBOutlet var timer: WKInterfaceTimer!
  @IBOutlet var lapLabel: WKInterfaceLabel!
  @IBOutlet var startButton: WKInterfaceButton!

  var trackTimer: TrackTimer!

  override func awakeWithContext(context: AnyObject?) {
    super.awakeWithContext(context)

    if let track = context as? Track {
      if let timer = TrackTimerStore.sharedStore.timers[track] {
        trackTimer = timer
      } else {
        trackTimer = TrackTimer(track: track)
        TrackTimerStore.sharedStore.timers[track] = trackTimer
      }
      nameLabel.setText(track.name.uppercaseString)

      updateState()
    }
  }

  func updateState() {
    startButton.setTitle(trackTimer.hasStarted ? "Add Lap" : "Start!")

    timer.setDate(trackTimer.hasStarted ? trackTimer.playTime! : NSDate())

    if trackTimer.isRunning {
      timer.start()
    } else {
      timer.stop()
    }
    lapLabel.setText("Lap \(trackTimer.lap)/\(trackTimer.track.laps)")
  }

  func startTimer() {
    trackTimer.resume()
    updateState()
  }
    
    func updateMenuItems() {
        
        clearAllMenuItems()
        if trackTimer.hasStarted {
            addMenuItemWithItemIcon(.Decline, title: "End", action: "reset")
            if trackTimer.isPaused  {
                addMenuItemWithItemIcon(.Play, title: "Resume", action: "startTimer")
            } else {
                addMenuItemWithItemIcon(.Pause, title: "Pause", action: "pauseTimer")
            }
        }
    }

  @IBAction func onTimerButton() {
    trackTimer.addLap()
    startTimer()
  }
}
