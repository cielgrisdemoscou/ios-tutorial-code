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

class OptionsViewController: UIViewController {
  private var currentPage = 0
  @IBOutlet weak var readingModeSegmentedControl: UISegmentedControl!
  @IBOutlet weak var scrollView: UIScrollView!
  @IBOutlet weak var titleAlignmentSegmentedControl: UISegmentedControl!
  @IBOutlet weak var pageControl: UIPageControl!
  @IBOutlet weak var optionsView: UIView!
}

// MARK: - Lifecycle
extension OptionsViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    scrollView.scrollsToTop = false
    
    guard !UIAccessibility.isReduceTransparencyEnabled else {
      return
    }
    
    view.backgroundColor = .clear
    
    let blurEffect = UIBlurEffect(style: .dark)
    let blurView = UIVisualEffectView(effect: blurEffect)
    
    blurView.translatesAutoresizingMaskIntoConstraints = false
    view.insertSubview(blurView, at: 0)
    
    NSLayoutConstraint.activate([
      blurView.topAnchor.constraint(equalTo: view.topAnchor),
      blurView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
      blurView.heightAnchor.constraint(equalTo: view.heightAnchor),
      blurView.widthAnchor.constraint(equalTo: view.widthAnchor)
    ])
    
    let vibrancyEffect = UIVibrancyEffect(blurEffect: blurEffect)
    let vibrancyView = UIVisualEffectView(effect: vibrancyEffect)
    vibrancyView.translatesAutoresizingMaskIntoConstraints = false
    
    vibrancyView.contentView.addSubview(optionsView)
    blurView.contentView.addSubview(vibrancyView)

    NSLayoutConstraint.activate([
      vibrancyView
        .heightAnchor
        .constraint(equalTo: blurView.contentView.heightAnchor),
      vibrancyView
        .widthAnchor
        .constraint(equalTo: blurView.contentView.widthAnchor),
      vibrancyView
        .centerXAnchor
        .constraint(equalTo: blurView.contentView.centerXAnchor),
      vibrancyView
        .centerYAnchor
        .constraint(equalTo: blurView.contentView.centerYAnchor)
    ])

    NSLayoutConstraint.activate([
      optionsView
        .centerXAnchor
        .constraint(equalTo: vibrancyView.contentView.centerXAnchor),
      optionsView
        .centerYAnchor
        .constraint(equalTo: vibrancyView.contentView.centerYAnchor)
    ])

    
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    let theme = Theme.shared
    readingModeSegmentedControl.selectedSegmentIndex = theme.readingMode.rawValue
    titleAlignmentSegmentedControl.selectedSegmentIndex = theme.titleAlignment.rawValue
    currentPage = theme.font.rawValue
    pageControl.currentPage = currentPage
    synchronizeViews(scrolled: false)
  }
}

// MARK: - Actions
extension OptionsViewController {
  @IBAction func pageControlPageDidChange() {
    synchronizeViews(scrolled: false)
  }

  @IBAction func readingModeDidChange(_ segmentedControl: UISegmentedControl) {
    Theme.shared.readingMode = ReadingMode(rawValue: segmentedControl.selectedSegmentIndex) ?? .dayTime
  }

  @IBAction func titleAlignmentDidChange(_ segmentedControl: UISegmentedControl) {
    Theme.shared.titleAlignment = TitleAlignment(rawValue: segmentedControl.selectedSegmentIndex) ?? .left
  }

  private func synchronizeViews(scrolled: Bool) {
    let pageWidth = scrollView.bounds.width
    var page: Int = 0
    var offset: CGFloat = 0

    if scrolled {
      offset = scrollView.contentOffset.x
      page = Int(offset / pageWidth)
      pageControl.currentPage = page
    } else {
      page = pageControl.currentPage
      offset = CGFloat(page) * pageWidth
      scrollView.setContentOffset(CGPoint(x: offset, y: 0), animated: true)
    }

    if page != currentPage {
      currentPage = page
      Theme.shared.font = Font(rawValue: currentPage) ?? .firaSans
    }
  }
}

// MARK: - UIScrollViewDelegate
extension OptionsViewController: UIScrollViewDelegate {
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    if scrollView.isDragging || scrollView.isDecelerating {
      synchronizeViews(scrolled: true)
    }
  }
}
