//
//  ViewController.swift
//  IOSStepperTutorial
//
//  Created by Ted Hyeong on 14/12/2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stepper.wraps = true
        stepper.autorepeat = true
        stepper.maximumValue = 10
    }

    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        valueLabel.text = Int(sender.value).description
        
    }
    
}

