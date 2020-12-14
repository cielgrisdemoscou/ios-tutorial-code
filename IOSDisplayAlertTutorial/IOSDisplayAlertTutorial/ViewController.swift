//
//  ViewController.swift
//  IOSDisplayAlertTutorial
//
//  Created by Ted Hyeong on 14/12/2020.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showAlert(_ sender: Any) {
        let alertController = UIAlertController(title: "iOScreator", message: "Hello world", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
}

