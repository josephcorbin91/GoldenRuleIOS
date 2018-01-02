//
//  FirstViewController.swift
//  GoldenRuleIOS
//
//  Created by user909394 on 12/27/17.
//  Copyright © 2017 JohnTuttle. All rights reserved.
//

import UIKit
import UserNotifications

class FirstViewController: UIViewController {

    var messageSubtitle = "Staff meeting in 20 minutes"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addBackground()
 UNUserNotificationCenter.current().requestAuthorization(options: 
			[[.alert, .sound, .badge]], 
				completionHandler: { (granted, error) in
            // Handle Error
        })
    }

    extension UIView {

    func addBackground() {
    // screen width and height:
    let width = UIScreen.mainScreen().bounds.size.width
    let height = UIScreen.mainScreen().bounds.size.height

    let imageViewBackground = UIImageView(frame: CGRectMake(0, 0, width, height))
    imageViewBackground.image = UIImage(named: "earth_background.png")

    // you can change the content mode:
    imageViewBackground.contentMode = UIViewContentMode.ScaleAspectFill

    self.addSubview(imageViewBackground)
    self.sendSubviewToBack(imageViewBackground)
}}
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

