//
//  ViewController.swift
//  IOSRotateImageTutorial
//
//  Created by Ted Hyeong on 15/12/2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func rotateImage(_ sender: Any) {
        UIView.animate(withDuration: 0.5, animations: {
            self.imageView.transform = CGAffineTransform(rotationAngle: (180.0 * .pi) / 180.0)
        })
    }
    
}

