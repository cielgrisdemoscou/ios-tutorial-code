//
//  ViewController.swift
//  IOSCircularImageTutorial
//
//  Created by Ted Hyeong on 22/12/2020.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var circularImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        circularImage.layer.masksToBounds = true
        circularImage.layer.cornerRadius = circularImage.bounds.width / 2
    }


}

