//
//  ViewController.swift
//  IOSScreenEdgePanGestureTutorial
//
//  Created by Ted Hyeong on 11/12/2020.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var screenEdgeRecognizer: UIScreenEdgePanGestureRecognizer!
    var currentRadius: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        screenEdgeRecognizer = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(rotateBall))
        screenEdgeRecognizer.edges = .left
        view.addGestureRecognizer(screenEdgeRecognizer)
    }
    
    @objc func rotateBall(sender: UIScreenEdgePanGestureRecognizer) {
        if sender.state == .ended {
            if currentRadius == 360.0 {
                currentRadius = 0.0
            }
            
            UIView.animate(withDuration: 1.0, animations: {
                self.currentRadius += 90.0
                self.imageView.transform = CGAffineTransform(rotationAngle: self.currentRadius * .pi / 180.0)
            })
        }
    }


}

