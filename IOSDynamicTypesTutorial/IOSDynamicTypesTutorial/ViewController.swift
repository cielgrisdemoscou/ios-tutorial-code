//
//  ViewController.swift
//  IOSDynamicTypesTutorial
//
//  Created by Ted Hyeong on 17/12/2020.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var headlineLabel: UILabel!
    @IBOutlet weak var subheadlinelabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var footNoteLabel: UILabel!
    @IBOutlet weak var caption1Label: UILabel!
    @IBOutlet weak var caption2Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFonts()
    }
    
    func updateFonts() {
        headlineLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        subheadlinelabel.font = UIFont.preferredFont(forTextStyle: .body)
        footNoteLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
        caption1Label.font = UIFont.preferredFont(forTextStyle: .caption1)
        caption2Label.font = UIFont.preferredFont(forTextStyle: .caption2)
    }


}

