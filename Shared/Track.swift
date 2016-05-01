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

class Track: NSObject {

  let name: String
  let countryAbbr: String
  let imageName: String
  let circuitLength: Double // km
  let laps: Int

  init(name: String, countryAbbr: String, imageName: String, circuitLength: Double, laps: Int) {
    self.name = name
    self.countryAbbr = countryAbbr
    self.imageName = imageName
    self.circuitLength = circuitLength
    self.laps = laps
  }

  static var famousTracks: [Track] {
    return [
      Track(name: "Spa Francorchamps", countryAbbr: "BEL", imageName: "spa", circuitLength: 7, laps: 44),
      Track(name: "Monte Carlo", countryAbbr: "MCO", imageName: "monte", circuitLength: 3.337, laps: 78),
      Track(name: "Austin", countryAbbr: "USA", imageName: "cota", circuitLength: 5.516, laps: 56),
      Track(name: "Red Bull Ring", countryAbbr: "AUT", imageName: "redbull", circuitLength: 4.326, laps: 71),
      Track(name: "Silverstone", countryAbbr: "ENG", imageName: "silverstone", circuitLength: 5.891, laps: 52),
      Track(name: "Monza", countryAbbr: "ITA", imageName: "monza", circuitLength: 5.793, laps: 53),
      Track(name: "Melbourne", countryAbbr: "AUS", imageName: "melbourne", circuitLength: 5.303, laps: 58),
    ]
  }

}