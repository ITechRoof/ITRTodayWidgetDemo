//
//  ViewController.swift
//  ITRTodayExtension
//
//  Created by Kiruthika Selvavinayagam on 26/04/18.
//  Copyright © 2018 Kiruthika Selvavinayagam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var selectedDestinationLabel: UILabel!
    
    let destinationArray: [String: String] = ["Bali"      : "Bali - Enjoy this Indonesian island with its volcanic mountain, beaches and coral reefs",
                                              "Singapore" : "Singapore - an island city-state off southern Malaysia. Enjoy night safari and universal studios here.",
                                              "Malaysia"  : "Malaysia - a Southeast Asian country known for its beaches, rainforests and mix of Malay, Chinese, Indian and European cultural influences"]
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func selectDestinationClicked() {
        
        let alertController = UIAlertController.init(title: "Destination", message: nil, preferredStyle: .actionSheet)
        for dest in destinationArray {
            let action = UIAlertAction.init(title: dest.key, style: .default) {[weak self] (action) in
                
                self?.selectedDestinationLabel.text = "You have selected " + dest.key
                if let userDefault = UserDefaults.init(suiteName: "group.itr.todayWidget")
                {
                    userDefault.setValue(dest.value, forKey: "Destination")
                    userDefault.synchronize()
                }
            }
            alertController.addAction(action)
        }
        let cancelAction = UIAlertAction.init(title: "Cancel", style: .destructive, handler: nil)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

