//
//  TableViewController.swift
//  IOSPullToRefreshTutorial
//
//  Created by Ted Hyeong on 16/12/2020.
//

import UIKit

class TableViewController: UITableViewController {
    
    var alphabet = ["A","B","C","D","E","F","G","H","I"]
    var isAscending = true

    override func viewDidLoad() {
        super.viewDidLoad()

        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(sortArray), for: .valueChanged)
        self.refreshControl = refreshControl
    }
    
    @objc func sortArray() {
        let sortedAlphabet = alphabet.reversed()
        
        for (index, element) in sortedAlphabet.enumerated() {
            alphabet[index] = element
        }
        
        tableView.reloadData()
        refreshControl?.endRefreshing()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alphabet.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        cell.textLabel?.text = alphabet[indexPath.row]
        return cell
    }

}
