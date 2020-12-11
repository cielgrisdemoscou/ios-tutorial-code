//
//  ViewController.swift
//  IOSPasteBoardTutorial
//
//  Created by Ted Hyeong on 11/12/2020.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var fromTextField: UITextField!
    @IBOutlet weak var toTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fromTextField.delegate = self
        toTextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        //when the return key is pressed the Keyboard is dismissed
        return false
    }
    
    @IBAction func copyText(_ sender: Any) {
        let copyString = fromTextField.text
        let pasteBoard = UIPasteboard.general
        pasteBoard.string = copyString
    }
    


}

