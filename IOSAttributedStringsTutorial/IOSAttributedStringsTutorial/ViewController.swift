//
//  ViewController.swift
//  IOSAttributedStringsTutorial
//
//  Created by Ted Hyeong on 15/12/2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var attributedLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let string = "Testing Attributed Strings"
        let attributedString = NSMutableAttributedString(string: string)
        
        let firstAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.blue,
            .backgroundColor: UIColor.yellow,
            .underlineStyle: 1]
        let secondAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.red,
            .backgroundColor: UIColor.blue,
            .strikethroughStyle: 1]
        let thirdAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.green,
            .backgroundColor: UIColor.black,
            .font: UIFont.systemFont(ofSize: 40)]
        
        attributedString.addAttributes(firstAttributes, range: NSRange(location: 0, length: 8))
        attributedString.addAttributes(secondAttributes, range: NSRange(location: 8, length: 11))

        attributedString.addAttributes(thirdAttributes, range: NSRange(location: 19, length: 7))
        
        attributedLabel.attributedText = attributedString

    }


}

