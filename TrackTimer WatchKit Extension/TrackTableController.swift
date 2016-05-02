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

class TrackTableController: WKInterfaceController {

  @IBOutlet var table: WKInterfaceTable!

  var tracks = Track.famousTracks

  override func awakeWithContext(context: AnyObject?) {
    super.awakeWithContext(context)

    updateTable(true)
  }

    func updateTable(alphaSort: Bool) {
        
        let sort :((Track, Track) -> Bool)
        if alphaSort {
            sort = { $0.name < $1.name }
        } else {
            sort = { $0.circuitLength < $1.circuitLength }
        }
    tracks = Track.famousTracks.sort(sort)

    table.setNumberOfRows(tracks.count, withRowType: "TrackRow")

    for i in 0..<table.numberOfRows {
      if let controller = table.rowControllerAtIndex(i) as? TrackRowController {
        let track = tracks[i]
        controller.nameLabel.setText(track.name)
        controller.icon.setImageNamed(track.imageName)
        controller.countryLabel.setText(track.countryAbbr)

        let formatLength = NSString(format: "%.1fkm", track.circuitLength) as String
        controller.lengthLabel.setText(formatLength)
      }
    }
  }

  override func contextForSegueWithIdentifier(segueIdentifier: String, inTable table: WKInterfaceTable, rowIndex: Int) -> AnyObject? {
    return tracks[rowIndex]
  }
    
    @IBAction func onAplhaSort() {
        
        updateTable(true)
    }
    
    @IBAction func onCircuitSort() {
        
        updateTable(false)
    }

}
