//
//  NumberViewController.swift
//  IOSCustomizingTableViewTutorial
//
//  Created by Ted Hyeong on 12/12/2020.
//

import UIKit

class NumberViewController: UITableViewController {
    
    var numbers = ["One","Two","Three","Four","Five"]

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.backgroundColor = UIColor.gray
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        tableView.separatorColor = UIColor.blue
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return numbers.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        cell.textLabel?.text = numbers[indexPath.row]
        cell.backgroundColor = UIColor.clear

        return cell
    }

}
