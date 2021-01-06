//
//  CarListViewController.swift
//  IOSDataLoadPropertyListTutorial
//
//  Created by Ted Hyeong on 11/12/2020.
//

import UIKit

class CarListViewController: UITableViewController {
    
    var tableData = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        let path = Bundle.main.path(forResource: "Property List", ofType: "plist")!
        
        let dict = NSDictionary(contentsOfFile: path)
        
        tableData = dict!.object(forKey: "AppleDevice") as! [String]
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) 
        
        cell.textLabel?.text = tableData[indexPath.row]
        
        return cell
    }

}
