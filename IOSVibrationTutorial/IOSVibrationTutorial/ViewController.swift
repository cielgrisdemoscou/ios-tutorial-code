//
//  ViewController.swift
//  IOSVibrationTutorial
//
//  Created by Ted Hyeong on 13/12/2020.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func startVibration(_ sender: Any) {
        for _ in 1...5 {
            AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
            sleep(1)
        }
    }
    
}

