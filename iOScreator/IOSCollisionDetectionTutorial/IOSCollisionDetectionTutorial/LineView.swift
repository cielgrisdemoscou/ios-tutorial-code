//
//  LineView.swift
//  IOSCollisionDetectionTutorial
//
//  Created by Ted Hyeong on 15/12/2020.
//

import UIKit

class LineView: UIView {

    func drawLineFromPoint(fromX: CGFloat, toPoint toX: CGFloat, pointY y: CGFloat) {
        let currentContext = UIGraphicsGetCurrentContext()
            
        if let currentContext = currentContext {
            currentContext.setLineWidth(5.0)
            currentContext.move(to: CGPoint(x: fromX, y: y))
            currentContext.addLine(to: CGPoint(x: toX, y: y))
            currentContext.strokePath();
        }
    }
    
    override func draw(_ rect: CGRect) {
        drawLineFromPoint(fromX: 0, toPoint: bounds.size.width/3, pointY: bounds.size.height - 100.0)
        drawLineFromPoint(fromX: bounds.size.width/3, toPoint:bounds.size.width*0.67, pointY:bounds.size.height - 150.0)
        drawLineFromPoint(fromX: bounds.size.width*0.67, toPoint:bounds.size.width, pointY:bounds.size.height - 100.0)
    }
    
    

}
