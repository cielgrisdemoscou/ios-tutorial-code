//
//  ViewController.swift
//  IOSSliderTutorial
//
//  Created by Ted Hyeong on 17/12/2020.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var slider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func sliderValueChanged(_ sender: UISlider) {
        let currentValue = Int(sender.value)
        
        label.text = "\(currentValue)"
    }
    
    
}

