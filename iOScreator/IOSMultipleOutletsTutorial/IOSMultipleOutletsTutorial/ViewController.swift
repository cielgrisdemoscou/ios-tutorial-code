//
//  ViewController.swift
//  IOSMultipleOutletsTutorial
//
//  Created by Ted Hyeong on 13/12/2020.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for subview in view.subviews where subview.tag == 10 {
            let button = subview as! UIButton
            button.addTarget(self, action: #selector(changeColorRed), for: .touchUpInside)
        }
        
        for subview in view.subviews where subview.tag == 20 {
            let button = subview as! UIButton
            button.addTarget(self, action: #selector(changeColorGreen), for: .touchUpInside)
        }
        
    }


    @objc func changeColorRed(sender: Any) {
        let button = sender as! UIButton
        button.tintColor = UIColor.red
    }
    
    @objc func changeColorGreen(sender: Any) {
        let button = sender as! UIButton
        button.tintColor = UIColor.green
    }
}

