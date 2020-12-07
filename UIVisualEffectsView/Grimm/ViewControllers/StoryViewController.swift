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

class StoryViewController: UIViewController {
  @IBOutlet weak var storyView: StoryView!
  @IBOutlet weak var optionsContainerView: UIView!
  @IBOutlet weak var optionsContainerViewBottomConstraint: NSLayoutConstraint!

  private var showingOptions = false
  private let story: Story

  required init?(coder: NSCoder) {
    fatalError("init(coder:) is not implemented")
  }

  init?(story: Story, coder: NSCoder) {
    self.story = story
    super.init(coder: coder)
  }
}

// MARK: - Lifecycle
extension StoryViewController {
  override func viewDidLoad() {
    super.viewDidLoad()

    let image = UIImage(systemName: "book.circle.fill")
    let imageView = UIImageView(image: image)
    imageView.frame.size = CGSize(width: 32, height: 32)

    storyView.story = story
    applyTheme()

    NotificationCenter
      .default
      .addObserver(
        self,
        selector: #selector(applyTheme),
        name: themeDidChangeNotification,
        object: nil)
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    setOptionsHidden(true, animated: false)
  }
}

// MARK: - Privates
private extension StoryViewController {
  @IBAction func optionsButtonTapped() {
    setOptionsHidden(showingOptions, animated: true)
  }

  func setOptionsHidden(_ hidden: Bool, animated: Bool) {
    showingOptions = !hidden
    let height = optionsContainerView.bounds.height
    let constant = hidden ? -height : view.safeAreaInsets.bottom
    view.layoutIfNeeded()

    optionsContainerViewBottomConstraint.constant = constant
    if animated {
      UIView.animate(withDuration: 0.2) {
        self.view.layoutIfNeeded()
      }
    }
  }

  @objc func applyTheme() {
    let theme = Theme.shared
    view.backgroundColor = theme.textBackgroundColor
    children.forEach { viewController in
      viewController.view.tintColor = theme.tintColor
    }
    storyView.applyTheme()
  }
}
