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

    @IBOutlet weak var InfoButton: UIButton!
    @IBOutlet weak var SetttingsButton: UIButton!
    
    @IBOutlet weak var Message: UIButton!
    @IBOutlet weak var Locator: UIButton!
    var messageSubtitle = "Staff meeting in 20 minutes"
    
	func sendNotification() {
    let content = UNMutableNotificationContent()
    content.title = "Golden Peace hour"
    content.subtitle = messageSubtitle
    content.body = "Do not forget to follow the golden rule"
    content.badge = 1
    var date = DateComponents()
    date.hour=12
    date.minute=34
		
    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60,repeats: true)
    let otherTrigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: true)
    let requestIdentifier = "demoNotification"
    let request = UNNotificationRequest(identifier: requestIdentifier,content: content, trigger: trigger)
    UNUserNotificationCenter.current().add(request,withCompletionHandler: { (error) in
        	// Handle error
    })
	}
	
	
	
	func makeRestCall(){
		
	let session = URLSession(configuration: URLSessionConfiguration.default)

let request = URLRequest(url: URL(string: "https://golden-rule-node-back-end.herokuapp.com/api/messages")!)

        let task: URLSessionDataTask = session.dataTask(with: request) { (data, response, error) -> Void in
    if let data = data {
        let response = String(data: data, encoding: String.Encoding.utf8)
        print(response)
    }
}
task.resume()	
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
	    makeRestCall()

        
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
    imageViewBackground.image = UIImage(named: "HomePageGoldenRule.jpeg")

    // you can change the content mode:
    imageViewBackground.contentMode = UIViewContentMode.scaleAspectFill

    self.addSubview(imageViewBackground)
    self.sendSubview(toBack: imageViewBackground)
}}

