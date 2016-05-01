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

import Foundation

class TrackTimerStore {

  static let sharedStore = TrackTimerStore()

  var timers = [Track: TrackTimer]()

}

class TrackTimer {

  private(set) var lap = 0
  private(set) var playTime: NSDate?
  private var pauseTime: NSDate?

  let track: Track

  init(track: Track) {
    self.track = track
  }

  func resume() -> NSDate {
    let start: NSDate
    if let pause = pauseTime {
      let gap = pause.timeIntervalSinceNow
      start = playTime?.dateByAddingTimeInterval(-gap) ?? NSDate()
    } else {
      start = NSDate()
    }
    pauseTime = nil
    playTime = start
    return start
  }

  func addLap() {
    pauseTime = nil
    if lap < track.laps {
      lap++
    }
  }

  func pause() {
    pauseTime = NSDate()
  }

  var isPaused: Bool {
    return pauseTime != nil
  }

  var hasStarted: Bool {
    return playTime != nil
  }

  var isRunning: Bool {
    return hasStarted && !isPaused
  }
  
  func end() {
    playTime = nil
    pauseTime = nil
    lap = 0
  }
  
}
