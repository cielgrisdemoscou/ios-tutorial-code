//
//  ViewController.swift
//  IOSSafariViewControllerTutorial
//
//  Created by Ted Hyeong on 12/12/2020.
//

import UIKit
import SafariServices

class ViewController: UIViewController, SFSafariViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func openURL(_ sender: Any) {
        guard let url = URL(string: "https://apple.com") else { return }
        let safaraiVC = SFSafariViewController(url: url)
        safaraiVC.delegate = self
        present(safaraiVC, animated: true, completion: nil)
    }
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    
    
}

