//
//  TodayViewController.swift
//  Travel Today
//
//  Created by Kiruthika Selvavinayagam on 07/05/18.
//  Copyright © 2018 Kiruthika Selvavinayagam. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
    
    @IBOutlet weak var destLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.extensionContext?.widgetLargestAvailableDisplayMode = NCWidgetDisplayMode.expanded
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        
        if let suiteDefault = UserDefaults.init(suiteName: "group.itr.todayWidget") {
            if let dest = suiteDefault.value(forKey: "Destination") as? String {
                if dest != destLabel.text {
                    destLabel.text = dest
                    completionHandler(NCUpdateResult.newData)
                }
            }
        }
        completionHandler(NCUpdateResult.noData)
    }
    
//    @available(iOSApplicationExtension 10.0, *)
//    func widgetActiveDisplayModeDidChange(_ activeDisplayMode: NCWidgetDisplayMode, withMaximumSize maxSize: CGSize) {
//        switch activeDisplayMode {
//        case .compact:
//            self.preferredContentSize = CGSize(width:maxSize.width, height:50)
//        case .expanded:
//            self.preferredContentSize = CGSize(width:maxSize.width, height:200)
//        }
//    }
    
}
