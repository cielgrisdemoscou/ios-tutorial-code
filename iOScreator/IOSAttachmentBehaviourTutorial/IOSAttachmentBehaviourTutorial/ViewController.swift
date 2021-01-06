//
//  ViewController.swift
//  IOSAttachmentBehaviourTutorial
//
//  Created by Ted Hyeong on 21/12/2020.
//

import UIKit

class ViewController: UIViewController {
    
    var anchorPoint: CGPoint!
    var attachment: UIAttachmentBehavior!
    var animator: UIDynamicAnimator!
    var gravity: UIGravityBehavior!

    @IBOutlet weak var blueView: UIView!
    @IBOutlet weak var blackView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        anchorPoint = blueView.center
        
        attachment = UIAttachmentBehavior(item: blueView, attachedToAnchor: anchorPoint)
        attachment.length = 100
        attachment.frequency = 10
        attachment.damping = 5
        
        animator = UIDynamicAnimator(referenceView: view)
        animator.addBehavior(attachment)
        
        gravity = UIGravityBehavior(items: [blueView])
        animator.addBehavior(gravity)
    }

    @IBAction func handleTap(_ sender: UITapGestureRecognizer) {
        attachment.anchorPoint = sender.location(in: view)
        blackView.center = sender.location(in: view)
    }
    
}

