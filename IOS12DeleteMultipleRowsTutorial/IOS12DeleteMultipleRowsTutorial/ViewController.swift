//
//  ViewController.swift
//  IOS12DeleteMultipleRowsTutorial
//
//  Created by Ted Hyeong on 09/12/2020.
//

import UIKit

class ViewController: UITableViewController {

    var numbers = ["One","Two","Three","Four","Five","Six","Seven","Eight","Nine","Ten"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numbers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "numberCell", for: indexPath)
        cell.textLabel?.text = numbers[indexPath.row]
        return cell
    }

    @IBAction func startEditing(_ sender: Any) {
        isEditing = !isEditing
    }
    
    @IBAction func deleteRows(_ sender: Any) {
        if let selectedRows = tableView.indexPathsForSelectedRows {
            var items = [String]()
            for indexPath in selectedRows {
                items.append(numbers[indexPath.row])
            }
            
            for item in items {
                if let index = numbers.firstIndex(of: item) {
                    numbers.remove(at: index)
                }
            }
            
            tableView.beginUpdates()
            tableView.deleteRows(at: selectedRows, with: .automatic)
            tableView.endUpdates()
        }
    }
    
    
}

