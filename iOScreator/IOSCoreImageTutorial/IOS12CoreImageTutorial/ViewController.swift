//
//  ViewController.swift
//  iOS12CoreImageTutorial
//
//  Created by Ted Hyeong on 08/12/2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let image = UIImage(named: "dog.jpg") {
            let originalImage = CIImage(image: image)
            //Core Image works on CIImage object
            
            let filter = CIFilter(name: "CIPhotoEffectMono")
            filter?.setDefaults()
            filter?.setValue(originalImage, forKey: kCIInputImageKey)
            
            if let outputImage = filter?.outputImage {
                //Retuens a CIImage object that encapsultates the operations configured in the filter.
                let newImage = UIImage(ciImage: outputImage)
                //converted back to an UIImage object
                imageView.image = newImage
            }
        }
    }


}

