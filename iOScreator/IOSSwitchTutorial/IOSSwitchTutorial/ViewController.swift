//
//  ViewController.swift
//  IOSSwitchTutorial
//
//  Created by Ted Hyeong on 17/12/2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var stateSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stateSwitch.addTarget(self, action: #selector(stateChanged), for: .valueChanged)
    }
    
    @objc func stateChanged(switchState: UISwitch) {
        if switchState.isOn {
            textLabel.text = "The Switch is ON"
        } else {
            textLabel.text = "The Switch is Off"
        }
    }

    @IBAction func buttonClicked(_ sender: Any) {
        if stateSwitch.isOn {
            textLabel.text = "The Switch is Off"
            stateSwitch.setOn(false, animated: true)
        } else {
            textLabel.text = "The Switch is On"
            stateSwitch.setOn(true, animated: true)
        }
        
        
    }
    
}

