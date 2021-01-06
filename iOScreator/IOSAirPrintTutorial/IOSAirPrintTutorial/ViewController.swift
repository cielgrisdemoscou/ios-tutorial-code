//
//  ViewController.swift
//  IOSAirPrintTutorial
//
//  Created by Ted Hyeong on 17/12/2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func printText(_ sender: Any) {
        let printController = UIPrintInteractionController.shared
        let printInfo = UIPrintInfo(dictionary:nil)
        printInfo.outputType = .general
        printInfo.jobName = "print Job"
        printController.printInfo = printInfo
                
        let formatter = UIMarkupTextPrintFormatter(markupText: textView.text)
        formatter.perPageContentInsets = UIEdgeInsets(top: 72, left: 72, bottom: 72, right: 72)
        printController.printFormatter = formatter
                
       printController.present(animated: true, completionHandler: nil)
    }
    
}

