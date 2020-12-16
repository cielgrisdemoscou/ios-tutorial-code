//
//  ViewController.swift
//  IOSSnapBehaviourTutorial
//
//  Created by Ted Hyeong on 16/12/2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var animator: UIDynamicAnimator!
    var snapBehaviour: UISnapBehavior!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(userHasTapped))
        self.view.addGestureRecognizer(tapGesture)
        
        animator = UIDynamicAnimator(referenceView: view)
        
    }
    
    @objc func userHasTapped(tap: UITapGestureRecognizer) {
        let touchPoint = tap.location(in: view)
        
        //First the point is captured where the user has touched the screen. There can be only one Snap Behaviour instance active so we check if there is already a behaviour active. If so, we will remove this behaviour.
        if snapBehaviour != nil {
            animator.removeBehavior(snapBehaviour)
        }
        
        snapBehaviour = UISnapBehavior(item: imageView, snapTo: touchPoint)
        snapBehaviour.damping = 0.1
        animator.addBehavior(snapBehaviour)
    }


}

