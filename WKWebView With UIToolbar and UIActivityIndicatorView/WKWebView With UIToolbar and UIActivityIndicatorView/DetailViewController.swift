//
//  DetailViewController.swift
//  WKWebView With UIToolbar and UIActivityIndicatorView
//
//  Created by Ted Hyeong on 12/12/2020.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var WKWebView: WKWebView!
    
    let sampleURL = "https://developer.apple.com/documentation/webkit/wkwebview/"
    
    private var activityIndicatorContainer: UIView!
    private var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        WKWebView.navigationDelegate = self
        setToolBar()
        sendRequest(urlStirng: sampleURL)
    }
    
    private func sendRequest(urlStirng: String) {
        let myURL = URL(string: urlStirng)
        let myRequest = URLRequest(url: myURL!)
        WKWebView.load(myRequest)
    }
    
    fileprivate func setActivityIndicator() {
        activityIndicatorContainer = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        activityIndicatorContainer.center.x = WKWebView.center.x
        activityIndicatorContainer.center.y = WKWebView.center.y - 44
        activityIndicatorContainer.backgroundColor = UIColor.black
        activityIndicatorContainer.alpha = 0.8
        activityIndicatorContainer.layer.cornerRadius = 10
        
        activityIndicator = UIActivityIndicatorView()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = UIActivityIndicatorView.Style.large
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicatorContainer.addSubview(activityIndicator)
        WKWebView.addSubview(activityIndicatorContainer)
        
        activityIndicator.centerXAnchor.constraint(equalTo: activityIndicatorContainer.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: activityIndicatorContainer.centerYAnchor).isActive = true
        
    }
    
    fileprivate func setToolBar() {
        let screenWidth = self.view.bounds.width
        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(goBack))
        
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 44))
        toolBar.isTranslucent = false
        toolBar.translatesAutoresizingMaskIntoConstraints = false
        
        toolBar.items = [backButton]
        WKWebView.addSubview(toolBar)
        
        toolBar.bottomAnchor.constraint(equalTo: WKWebView.bottomAnchor, constant: 0).isActive = true
        toolBar.leadingAnchor.constraint(equalTo: WKWebView.leadingAnchor, constant: 0).isActive = true
        toolBar.trailingAnchor.constraint(equalTo: WKWebView.trailingAnchor, constant: 0).isActive = true
        
    }
    
    @objc private func goBack() {
        if WKWebView.canGoBack {
            WKWebView.goBack()
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    fileprivate func showActivityIndicator(show: Bool) {
        if show {
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
            activityIndicatorContainer.removeFromSuperview()
        }
    }
}

extension DetailViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.showActivityIndicator(show: false)
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        self.setActivityIndicator()
        self.showActivityIndicator(show: true)
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        self.showActivityIndicator(show: false)
    }
}
