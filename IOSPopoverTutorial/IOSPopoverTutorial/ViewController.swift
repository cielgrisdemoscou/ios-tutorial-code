//
//  ViewController.swift
//  IOSPopoverTutorial
//
//  Created by Ted Hyeong on 22/12/2020.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func displayPopover(_ sender: UIBarButtonItem) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc = storyboard.instantiateViewController(withIdentifier: "PopoverViewController")
        
        vc.modalPresentationStyle = .popover
        let popover: UIPopoverPresentationController = vc.popoverPresentationController!
        
        popover.barButtonItem = sender
        present(vc, animated: true, completion: nil)
    }
    
}

