//
//  ViewController.swift
//  IOSVolumeViewTutorial
//
//  Created by Ted Hyeong on 21/12/2020.
//

import UIKit
import AVFoundation
import MediaPlayer

class ViewController: UIViewController {
    
    var audioPlayer = AVAudioPlayer()
    let wrapperView = UIView(frame: CGRect(x: 30, y: 30, width: 300, height: 20))

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let asset = NSDataAsset(name: "amorphis-my-enemy") {
            do {
                try AVAudioSession.sharedInstance().setCategory(.playback)
                try AVAudioSession.sharedInstance().setActive(true)
                try audioPlayer = AVAudioPlayer(data: asset.data, fileTypeHint: "mp3")
                
                audioPlayer.prepareToPlay()
            } catch {
                print("error")
            }
        }
    }

    @IBAction func playSound(_ sender: Any) {
        audioPlayer.play()
        
        view.backgroundColor = UIColor.clear
        view.addSubview(wrapperView)
        
        let volumeView = MPVolumeView(frame: wrapperView.bounds)
        wrapperView.addSubview(volumeView)
        
    }
    
    @IBAction func stopSound(_ sender: Any) {
        audioPlayer.stop()
        wrapperView.removeFromSuperview()
    }
}

