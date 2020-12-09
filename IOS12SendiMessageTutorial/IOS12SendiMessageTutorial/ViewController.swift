//
//  ViewController.swift
//  IOS12SendiMessageTutorial
//
//  Created by Ted Hyeong on 09/12/2020.
//

import UIKit
import MessageUI

class ViewController: UIViewController, MFMessageComposeViewControllerDelegate{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func sendMessage(_ sender: Any) {
        let messageVC = MFMessageComposeViewController()
        
        messageVC.body = "Enter a message"
        messageVC.recipients = ["Enter tel-nr"]
        messageVC.messageComposeDelegate = self
        
        self.present(messageVC, animated: true, completion: nil)
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        switch (result) {
        case .cancelled:
            print("Message was cancelled")
            dismiss(animated: true, completion: nil)
        case .failed:
            print("Message failed")
            dismiss(animated: true, completion: nil)
        case .sent:
            print("Message was sent")
            dismiss(animated: true, completion: nil)
        default:
            break
        }
    }
    

}

