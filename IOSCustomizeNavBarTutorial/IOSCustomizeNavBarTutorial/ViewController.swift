//
//  ViewController.swift
//  IOSCustomizeNavBarTutorial
//
//  Created by Ted Hyeong on 15/12/2020.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let nav = self.navigationController?.navigationBar
        
        nav?.barStyle = UIBarStyle.black
        nav?.tintColor = UIColor.yellow
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.contentMode = .scaleAspectFit
        
        let image = UIImage(named: "Apple_Swift_Logo")
        imageView.image = image
        
        navigationItem.titleView = imageView
    }


}

