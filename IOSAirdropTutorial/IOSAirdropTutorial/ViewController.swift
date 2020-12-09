//
//  ViewController.swift
//  IOSAirdropTutorial
//
//  Created by Ted Hyeong on 09/12/2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImage(named: "imac.jpg")
        imageView.image = image
    }

    @IBAction func shareImage(_ sender: Any) {
        let image = imageView.image!
        let controller = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        //controller.excludedActivityTypes = [.postToFacebook, .postToTwitter, .print, .copyToPasteboard, .assignToContact, .saveToCameraRoll]
        
        self.present(controller, animated: true, completion: nil)
    }
}

