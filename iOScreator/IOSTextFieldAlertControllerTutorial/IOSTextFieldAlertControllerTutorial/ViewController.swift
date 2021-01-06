//
//  ViewController.swift
//  IOSTextFieldAlertControllerTutorial
//
//  Created by Ted Hyeong on 13/12/2020.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showAlertController(_ sender: Any) {
        
        var usernameTextField: UITextField?
        var passwordTextField: UITextField?
        
        let alertController = UIAlertController(
            title: "Log in", message: "Please enter your credentials", preferredStyle: .alert
        )
        
        let loginAction = UIAlertAction(title: "Log in", style: .default) { (action) -> Void in
            
            if let username = usernameTextField?.text {
                print("Username = \(username)")
            } else {
                print("No Username entered")
            }
            
            if let password = passwordTextField?.text {
                print("Passoword = \(password)")
            } else {
                print("No Password entered")
            }
        }
        
        alertController.addTextField { (txtUsername) -> Void in
            usernameTextField = txtUsername
            usernameTextField?.placeholder = "<Your username here>"
        }
        
        alertController.addTextField { (txtPassword) -> Void in
            passwordTextField = txtPassword
            passwordTextField?.isSecureTextEntry = true
            passwordTextField?.placeholder = "<Your password here>"
        }
        
        alertController.addAction(loginAction)
        present(alertController, animated: true, completion: nil)
        
    }
    
}

