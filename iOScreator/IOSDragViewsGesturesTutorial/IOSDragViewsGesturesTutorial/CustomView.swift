//
//  CustomView.swift
//  IOSDragViewsGesturesTutorial
//
//  Created by Ted Hyeong on 15/12/2020.
//

import UIKit

class CustomView: UIView {
    
    var lastLocation = CGPoint(x: 0, y: 0)

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(detectPan))
        self.gestureRecognizers = [panRecognizer]
        
        let blueValue = CGFloat.random(in: 0..<1)
        let greenValue = CGFloat.random(in: 0..<1)
        let redValue = CGFloat.random(in: 0..<1)
        
        self.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func detectPan(_ recognizer: UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: self.superview)
        self.center = CGPoint(x: lastLocation.x + translation.x, y: lastLocation.y + translation.y)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.superview?.bringSubviewToFront(self)
        lastLocation = self.center
    }

}
