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

import UIKit

class TimerTableViewController: UITableViewController {

  var trackTimer: TrackTimer!

  @IBOutlet weak var timerLabel: UILabel!
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var lapsCell: UITableViewCell!
  @IBOutlet weak var lapButton: UILabel!

  lazy var timer: MZTimerLabel = {
    let label = MZTimerLabel(label: self.timerLabel)
    label.timeFormat = "mm:ss:SS"
    return label
  }()

  override func viewDidLoad() {
    super.viewDidLoad()

    title = trackTimer.track.name
    imageView.image = UIImage(named: trackTimer.track.imageName)
    updateLap()
  }

  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    tableView.deselectRowAtIndexPath(indexPath, animated: true)

    if indexPath.section == 3 {
      trackTimer.addLap()
      lapButton.text = "Add Lap"
      timer.reset()
      timer.start()
      updateLap()
    }
  }

  func updateLap() {
    lapsCell.textLabel?.text = NSString(format: "Lap %zi/%zi", trackTimer.lap, trackTimer.track.laps) as String
  }

}
