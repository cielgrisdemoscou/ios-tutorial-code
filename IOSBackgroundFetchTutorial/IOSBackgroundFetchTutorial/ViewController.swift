//
//  ViewController.swift
//  IOSBackgroundFetchTutorial
//
//  Created by Ted Hyeong on 22/12/2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    
    var currentTime: Date?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func updateTime() {
        currentTime = Date()
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        
        if let currentTime = currentTime {
            timeLabel.text = formatter.string(from: currentTime)
        }
    }


}

