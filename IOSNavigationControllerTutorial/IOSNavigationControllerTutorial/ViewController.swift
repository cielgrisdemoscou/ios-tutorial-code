//
//  ViewController.swift
//  IOSNavigationControllerTutorial
//
//  Created by Ted Hyeong on 22/12/2020.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.title = "Root View"
    }

    @IBAction func showFirstViewController(_ sender: Any) {
        performSegue(withIdentifier: "SegueToFirstVC", sender: self)
    }
    
}

