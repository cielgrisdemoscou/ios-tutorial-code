//
//  ViewController.swift
//  IOSTabBarCustomizationTutorial
//
//  Created by Ted Hyeong on 14/12/2020.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let tabBar = self.tabBarController?.tabBar else { return }
        
        tabBar.tintColor = UIColor.white
        tabBar.barTintColor = UIColor.green
        tabBar.unselectedItemTintColor = UIColor.yellow
        
        guard let tabBarItem = self.tabBarItem else { return }
        
        tabBarItem.badgeValue = "123"
        tabBarItem.badgeColor = UIColor.blue
        
    }


}

