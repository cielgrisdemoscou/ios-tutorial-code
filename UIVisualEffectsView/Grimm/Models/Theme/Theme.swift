/// Copyright (c) 2020 Razeware LLC
/// 
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
/// 
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
/// 
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
/// 
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import UIKit

let themeDidChangeNotification = Notification.Name("ThemeDidChangeNotification")

class Theme {
  static var shared = Theme()

  private let bodyFonts = [
    "FiraSans-Regular",
    "NotoSans",
    "OpenSans",
    "PTSans-Regular",
    "SourceSansPro-Regular"
  ]

  private let headlineFonts = [
    "FiraSans-SemiBold",
    "NotoSans-Bold",
    "OpenSans-Semibold",
    "PTSans-Bold",
    "SourceSansPro-Semibold"
  ]

  private let textBackgroundColors = [UIColor.white, UIColor.nightTimeTextBackground]
  private let textColors = [UIColor.darkText, UIColor.nightTimeText]

  var font: Font = .firaSans {
    didSet {
      notifyObservers()
    }
  }

  var readingMode: ReadingMode = .dayTime {
    didSet {
      notifyObservers()
    }
  }
  var titleAlignment: TitleAlignment = .center {
    didSet {
      notifyObservers()
    }
  }

  var barTintColor: UIColor {
    let color = textBackgroundColors[readingMode.rawValue]
    return color.colorForTranslucency()
  }

  var tintColor: UIColor? {
    return readingMode == .dayTime ? nil : UIColor.nightTimeTint
  }

  var separatorColor: UIColor {
    return readingMode == .dayTime ? UIColor.defaultSeparator : UIColor.nightTimeTint
  }

  var textBackgroundColor: UIColor {
    return textBackgroundColors[readingMode.rawValue]
  }

  var textColor: UIColor {
    return textColors[readingMode.rawValue]
  }

  func preferredFont(forTextStyle style: UIFont.TextStyle) -> UIFont {
    let systemFont = UIFont.preferredFont(forTextStyle: style)

    if font == .system {
      return systemFont
    }

    let size = systemFont.pointSize
    var preferredFont: UIFont?

    switch style {
    case .headline:
      preferredFont = UIFont(name: headlineFonts[font.rawValue], size: size)
    default:
      preferredFont = UIFont(name: bodyFonts[font.rawValue], size: size)
    }

    return preferredFont ?? systemFont
  }

  private func notifyObservers() {
    NotificationCenter.default.post(name: themeDidChangeNotification, object: nil)
  }
}
