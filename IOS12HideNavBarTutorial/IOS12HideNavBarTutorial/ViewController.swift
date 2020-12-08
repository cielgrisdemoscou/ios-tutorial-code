//
//  ViewController.swift
//  IOS12HideNavBarTutorial
//
//  Created by Ted Hyeong on 08/12/2020.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showFullSize(_ sender: Any) {
        let fullImageView = UIImageView(frame: self.view.frame)
        let image = UIImage(named: "sunset.jpg")
        fullImageView.image = image
        
        view.addSubview(fullImageView)
        navigationController?.hidesBarsOnTap = true
        //navigationController?.hidesBarsOnSwipe = true
        //navigationController?.hidesBottomBarWhenPushed = true
        //navigationController?.hidesBarsWhenVerticallyCompact = true
    }
    
}

