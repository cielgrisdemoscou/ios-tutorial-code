//
//  TableViewController.swift
//  IOSSpellingCheckerTutorial
//
//  Created by Ted Hyeong on 22/12/2020.
//

import UIKit

class TableViewController: UITableViewController {
    
    let words = ["devalopment", "development","devellopment"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return words.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        cell.textLabel?.text = words[indexPath.row]
        cell.textLabel?.backgroundColor = UIColor.clear

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            let currentWord = cell.textLabel?.text
            if let currentWord = currentWord {
                if wordIsSpelledCorrect(word: currentWord) {
                    cell.backgroundColor = UIColor.green
                } else {
                    cell.backgroundColor = UIColor.red
                }
                
                tableView.reloadData()
            }
        }
    }
    
    func wordIsSpelledCorrect(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.count)
        let wordRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        return wordRange.location == NSNotFound
    }

}
