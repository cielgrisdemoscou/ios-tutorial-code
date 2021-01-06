//
//  ViewController.swift
//  IOSSpringAnimationTutorial
//
//  Created by Ted Hyeong on 16/12/2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    var labelPositionisLeft = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func startAnimation(_ sender: Any) {
        UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            if self.labelPositionisLeft {
                self.label.center.x = self.view.bounds.width - 100
            } else {
                self.label.center.x = 100
            }
            self.labelPositionisLeft = !(self.labelPositionisLeft)
        }, completion: nil)

    }
    
}

