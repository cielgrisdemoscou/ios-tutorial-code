//
//  ViewController.swift
//  IOS12ReorderRowsTutorial
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
        numbers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "numberCell", for: indexPath)
        cell.textLabel?.text = numbers[indexPath.row]
        
        return cell
    }
    
    @IBAction func startEditing(_ sender: Any) {
        isEditing = !isEditing
    }
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let itemToMove = numbers[sourceIndexPath.row]
        numbers.remove(at: sourceIndexPath.row)
        numbers.insert(itemToMove, at: destinationIndexPath.row)
    }
}

