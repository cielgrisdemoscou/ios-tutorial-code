//
//  ViewController.swift
//  IOSOpenPDFTutorial
//
//  Created by Ted Hyeong on 12/12/2020.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func openPDF(_ sender: Any) {
        let url = Bundle.main.url(forResource: "Alice_In_Wonderland", withExtension: "pdf")
        
        if let url = url {
            let webView = WKWebView(frame: view.frame)
            let urlRequest = URLRequest(url: url)
            webView.load(urlRequest)
            webView.navigationDelegate = self
            view.addSubview(webView)
        }
    }
    
}

