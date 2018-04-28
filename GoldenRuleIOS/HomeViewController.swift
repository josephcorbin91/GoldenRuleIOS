//
//  HomeViewController.swift
//  GoldenRuleIOS
//
//  Created by user132771 on 3/23/18.
//  Copyright © 2018 JohnTuttle. All rights reserved.
// Password for keychain Ulc21297!
//email used johntuttle1949@gmail.com
// name john tuttle

import UIKit
import UserNotifications

class HomeViewController: UIViewController, UNUserNotificationCenterDelegate {
    var notificationGranted=false
    
    func changeSettings(){
        
    }
    

    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        completionHandler([.alert, .sound])
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "home")?.draw(in: self.view.bounds)
        
        if let image = UIGraphicsGetImageFromCurrentImageContext(){
            UIGraphicsEndImageContext()
            self.view.backgroundColor = UIColor(patternImage: image)
        }else{
            UIGraphicsEndImageContext()
            debugPrint("Image not available")
            
        }

        UNUserNotificationCenter.current().requestAuthorization(options: [[.alert, .sound, .badge]], completionHandler: { (granted, error) in
            // Handle Error
        })
        repeatNotification()
        UNUserNotificationCenter.current().delegate = self

        
            
        
    }
    
    func repeatNotification(){
        
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["alarmNotification"])

        var soundMusic = UserDefaults.standard.bool(forKey: "SoundMusic")
        var SoundChime = UserDefaults.standard.bool(forKey: "SoundChime")
        var Vibration = UserDefaults.standard.bool(forKey: "Vibration")
        var SponsoredNotification = UserDefaults.standard.bool(forKey: "Sponsored Notification")
        var DefaultNotification = UserDefaults.standard.bool(forKey: "Default Notification")
        let content = UNMutableNotificationContent()
        content.title = "Global Peace Minute    1234pm Daily"
        content.body="Treat others as you would like to be treated."
        
        if(DefaultNotification && !SponsoredNotification){
            content.subtitle = "Co-Sponsored by : "
            
        }
        if(SponsoredNotification && !DefaultNotification){
            
            
        }
        
        
        if(soundMusic){
            content.sound = UNNotificationSound(named: "music.wav")
        }
        else if(SoundChime){
            content.sound = UNNotificationSound(named: "chime.wav")
            
        }
        
        
        //content.badge = 1
        
        
        var date = DateComponents()
        date.hour = 12
        date.minute = 26
        //let trigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: true)
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: true)
        
        let requestIdentifier = "alarmNotification"
        let request = UNNotificationRequest(identifier: requestIdentifier,
                                            content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request,
                                               withCompletionHandler: { (error) in
                                                // Handle error
        })
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
