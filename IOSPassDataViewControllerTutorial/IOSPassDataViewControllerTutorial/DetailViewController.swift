//
//  DetailViewController.swift
//  IOSPassDataViewControllerTutorial
//
//  Created by Ted Hyeong on 17/12/2020.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailLabel: UILabel!
    
    var selectedNumber: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        detailLabel.text = selectedNumber
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
