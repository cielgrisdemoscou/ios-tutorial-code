//
//  ViewController.swift
//  IOSFlyOverMapKitTutorial
//
//  Created by Ted Hyeong on 21/12/2020.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    let distance: CLLocationDistance = 800
    let pitch: CGFloat = 40
    let heading = 45.0
    var camera: MKMapCamera?
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.mapType = .satelliteFlyover
        
        let coordinate = CLLocationCoordinate2DMake(38.889819, -77.009066)
        camera = MKMapCamera(lookingAtCenter: coordinate, fromDistance: distance, pitch: pitch, heading: heading)
        mapView.camera = camera!
    }
    
    @IBAction func rotateLeft(_ sender: Any) {
        UIView.animate(withDuration: 1.0) {
            self.camera!.heading -= 10
            self.mapView.camera = self.camera!
        }
    }
    
    @IBAction func rotateRight(_ sender: Any) {
        UIView.animate(withDuration: 1.0) {
            self.camera!.heading += 10
            self.mapView.camera = self.camera!
        }
    }
    

}

