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
    
	func sendNotification() {
    let content = UNMutableNotificationContent()
    content.title = "Meeting Reminder"
    content.subtitle = messageSubtitle
    content.body = "Don't forget to bring coffee."
    content.badge = 1
		
    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5,repeats: false)
    let requestIdentifier = "demoNotification"
    let request = UNNotificationRequest(identifier: requestIdentifier,content: content, trigger: trigger)
    UNUserNotificationCenter.current().add(request,withCompletionHandler: { (error) in
        	// Handle error
    })
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addBackground()
 UNUserNotificationCenter.current().requestAuthorization(options: 
			[[.alert, .sound, .badge]], 
				completionHandler: { (granted, error) in
            // Handle Error
        })
	    sendNotification()
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


extension UIView {

    func addBackground() {
    // screen width and height:
    let width = UIScreen.main.bounds.size.width
    let height = UIScreen.main.bounds.size.height

    let imageViewBackground = UIImageView(frame: CGRect(x:0, y:0, width:width, height:height))
    imageViewBackground.image = UIImage(named: "earth_background.png")

    // you can change the content mode:
    imageViewBackground.contentMode = UIViewContentMode.scaleAspectFill

    self.addSubview(imageViewBackground)
    self.sendSubview(toback: imageViewBackground)
}}

