//
//  SquareView.swift
//  IOSLiveRenderingTutorial
//
//  Created by Ted Hyeong on 11/12/2020.
//

import UIKit

@IBDesignable

class SquareView: UIView {
    
    @IBInspectable var borderColor: UIColor = UIColor.blue {
       didSet {
           layer.borderColor = borderColor.cgColor
       }
   }

    override func draw(_ rect: CGRect) {
        if let context = UIGraphicsGetCurrentContext() {
            
            context.setLineWidth(10.0)
            
            borderColor.set()
            
            context.addRect(rect)
            
            context.strokePath()
        }
    }

}
