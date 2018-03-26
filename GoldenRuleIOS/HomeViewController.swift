//
//  HomeViewController.swift
//  GoldenRuleIOS
//
//  Created by user132771 on 3/23/18.
//  Copyright © 2018 JohnTuttle. All rights reserved.
//

import UIKit
import UserNotifications

class HomeViewController: UIViewController {
    var notificationGranted=false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UNUserNotificationCenter.current().requestAuthorization(
        options: [.alert,.sound]) 
        { 
            (granted, error) in
            self.notificationGranted = granted
            if let error = error {
                print("granted, but Error in notification permission:\(error.localizedDescription)")
        }
            
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "home")?.draw(in: self.view.bounds)
        
        if let image = UIGraphicsGetImageFromCurrentImageContext(){
            UIGraphicsEndImageContext()
            self.view.backgroundColor = UIColor(patternImage: image)
        }else{
            UIGraphicsEndImageContext()
            debugPrint("Image not available")
            
        }

            if self.notificationGranted{
                self.repeatNotification()
            }  
        // Do any additional setup after loading the view.
    }
    }
         func repeatNotification(){
             
             var dateComponents = DateComponents()
// a more realistic example for Gregorian calendar. Every Monday at 11:30AM
//dateComponents.hour = 11
//dateComponents.minute = 30
dateComponents.second = 0
             let trigger = UNCalendarNotificationTrigger(
    dateMatching: dateComponents, 
    repeats: true)
let content = UNMutableNotificationContent()
content.title = "Pizza Time!!"
content.body = "Monday is Pizza Day"
content.categoryIdentifier = "pizza.reminder.category"

let request = UNNotificationRequest(identifier: "pizza.reminder", content: content, trigger: trigger)
 
UNUserNotificationCenter.current().add(request) { (error) in
    if let error = error {
        print("error in pizza reminder: \(error.localizedDescription)")
    }
}
print("added notification:\(request.identifier)")

            }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
