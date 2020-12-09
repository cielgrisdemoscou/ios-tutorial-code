//
//  ViewController.swift
//  IOSUserDefaultsTutorial
//
//  Created by Ted Hyeong on 09/12/2020.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var bluetoothSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        
        if (defaults.object(forKey: "SwitchState") != nil) {
            bluetoothSwitch.isOn = defaults.bool(forKey: "SwitchState")
        }
    }
    
    @IBAction func saveSwitchState(_ sender: Any) {
        let defaults = UserDefaults.standard
        
        if bluetoothSwitch.isOn {
            defaults.set(true, forKey: "SwitchState")
        } else {
            defaults.set(false, forKey: "SwitchState")
        }
    }
}

