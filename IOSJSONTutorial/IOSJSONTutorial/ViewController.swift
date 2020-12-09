//
//  ViewController.swift
//  IOSJSONTutorial
//
//  Created by Ted Hyeong on 09/12/2020.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func viewDidLoad() {
       super.viewDidLoad()

       // 1
       let urlString = "http://date.jsontest.com"
       guard let url = URL(string: urlString) else { return }
       
       // 2
       URLSession.shared.dataTask(with: url) { (data, response, error) in
           if error != nil {
               print(error!.localizedDescription)
           }

           guard let data = data else { return }
           do {
               // 3
               //Decode data
               let JSONData = try JSONDecoder().decode(JSONTest.self, from: data)

               // 4
               //Get back to the main queue
               DispatchQueue.main.async {
                   self.dateLabel.text = JSONData.date
                   self.timeLabel.text = JSONData.time
               }

           } catch let jsonError {
               print(jsonError)
           }
           // 5
           }.resume()
   }
}
