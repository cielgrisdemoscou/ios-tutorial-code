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

class StoryListViewController: UITableViewController {
  private var stories: [Story] = [] {
    didSet {
      tableView.reloadData()
    }
  }

  @IBSegueAction func makeStoryViewController(_ coder: NSCoder) -> StoryViewController? {
    guard let row = tableView.indexPathForSelectedRow?.row else {
      return nil
    }
    let story = stories[row]
    return StoryViewController(story: story, coder: coder)
  }
}

// MARK: - Lifecycle
extension StoryListViewController {
  override func viewDidLoad() {
    super.viewDidLoad()

    registerForNotifications()

    let image = UIImage(systemName: "book.circle.fill")
    let imageView = UIImageView(image: image)
    imageView.frame.size = CGSize(width: 32, height: 32)
    navigationItem.titleView = imageView
    applyTheme()

    tableView.rowHeight = UITableView.automaticDimension
    tableView.estimatedRowHeight = 79

    Story.loadStories { [unowned self] loadedStories in
      self.stories = loadedStories
    }
  }
}

// MARK: - Privates
private extension StoryListViewController {
  func registerForNotifications() {
    let notificationCenter = NotificationCenter.default
    notificationCenter
      .addObserver(
        self,
        selector: #selector(StoryViewController.preferredContentSizeDidChange(forChildContentContainer:)),
        name: UIContentSizeCategory.didChangeNotification,
        object: nil)

    notificationCenter
      .addObserver(
        self,
        selector: #selector(applyTheme),
        name: themeDidChangeNotification,
        object: nil)
  }

  @objc func applyTheme() {
    tableView.separatorColor = Theme.shared.separatorColor
    tableView.reloadData()
  }
}

// MARK: - UITableViewDataSource
extension StoryListViewController {
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return stories.count
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let storyCell = tableView.dequeueReusableCell(withIdentifier: "StoryCell", for: indexPath) as? StoryCell
    storyCell?.story = stories[indexPath.row]
    return storyCell ?? UITableViewCell()
  }
}
