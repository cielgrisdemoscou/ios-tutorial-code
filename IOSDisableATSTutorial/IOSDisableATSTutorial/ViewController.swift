//
//  ViewController.swift
//  IOSDisableATSTutorial
//
//  Created by Ted Hyeong on 12/12/2020.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        webRequest()
    }
    
    func webRequest() {
        let url = NSURL(string: "http://localhost:8000")
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {
            (data, response, error) in
            if let dataReturned = data {
               print(NSString(data: dataReturned, encoding: NSUTF8StringEncoding)!)
            }
        }
            
        task.resume()
        }

}

