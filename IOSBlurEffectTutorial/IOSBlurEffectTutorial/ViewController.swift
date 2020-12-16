//
//  ViewController.swift
//  IOSBlurEffectTutorial
//
//  Created by Ted Hyeong on 16/12/2020.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func blurImage(_ sender: Any) {
        
        let darkBlur = UIBlurEffect(style: .dark)
        
        let blurView = UIVisualEffectView(effect: darkBlur)
        blurView.frame = imageView.bounds
        
        imageView.addSubview(blurView)
    }
    
}

