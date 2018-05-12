//
//  SettingsViewController.swift
//  GoldenRuleIOS
//
//  Created by user132771 on 3/23/18.
//  Copyright
//

import UIKit
import AVFoundation
import UserNotifications

class SettingsViewController: UIViewController {
var player: AVAudioPlayer?

    @IBAction func backButtonPressed(_ sender: Any) {
        
        
        stopSoundChime()
        stopSoundMusic()
        
            
        
    }
    
    func repeatNotification(){
        
        printVariables()
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["alarmNotification"])
        var sponsor = UserDefaults.standard.string(forKey: "Sponsored")

        var soundMusic = UserDefaults.standard.bool(forKey: "SoundMusic")
        var SoundChime = UserDefaults.standard.bool(forKey: "SoundChime")
        var Vibration = UserDefaults.standard.bool(forKey: "Vibration")
        var SponsoredNotification = UserDefaults.standard.bool(forKey: "Sponsored Notification")
        var DefaultNotification = UserDefaults.standard.bool(forKey: "Default Notification")
        let content = UNMutableNotificationContent()
        content.title = "Global Peace Minute    1234pm Daily"
        content.body="Treat others as you would like to be treated."
        
        if(DefaultNotification && !SponsoredNotification){
            
        }
        if(SponsoredNotification && !DefaultNotification){
            
            let sponsorText = "Co-Sponsored by : "+sponsor!
            content.subtitle = sponsorText

        }
        
        
        if(soundMusic){
            content.sound = UNNotificationSound(named: "music.wav")
        }
        else if(SoundChime){
            content.sound = UNNotificationSound(named: "chime.wav")
            
        }
        
        
        //content.badge = 1
        
        
        var date = DateComponents()
        date.hour = 21
        date.minute = 35
        date.second = 00
        let trigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: true)
        //let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 600, repeats: true)
        
        let requestIdentifier = "alarmNotification"
        let request = UNNotificationRequest(identifier: requestIdentifier,
                                            content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request,
                                               withCompletionHandler: { (error) in
                                                // Handle error
        })
        
        let center = UNUserNotificationCenter.current()
        center.getPendingNotificationRequests(completionHandler: { requests in
            for request in requests {
                print("Notifications ")
                print(request)
            }
        })
    }
    
    
    
    
    func playSoundChime(){
         guard let url = Bundle.main.url(forResource: "chime", withExtension: "wav") else { return }

    do {
        try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
        try AVAudioSession.sharedInstance().setActive(true)



        /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
        player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

        /* iOS 10 and earlier require the following line:
        player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

        guard let player = player else { return }

        player.play()

    } catch let error {
        print(error.localizedDescription)
    }
    }
     func stopSoundChime(){
        guard let player = player else { return }
        
        player.stop()
    }
    func playSoundMusic(){
         guard let url = Bundle.main.url(forResource: "music", withExtension: "wav") else { return }

    do {
        try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
        try AVAudioSession.sharedInstance().setActive(true)



        /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
        player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

        /* iOS 10 and earlier require the following line:
        player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

        guard let player = player else { return }

        player.play()

    } catch let error {
        print(error.localizedDescription)
    }
        
    }
     func stopSoundMusic(){
        guard let player = player else { return }
        
        player.stop()
    }
    func vibrate(){
                AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))            

    }
    @IBOutlet weak var SoundChime: UISwitch!
    @IBOutlet weak var SoundMusic: UISwitch!
    @IBOutlet weak var OnScreenNotificationsSwitch: UISwitch!
   // @IBOutlet weak var VibrationsSwitch: UISwitch!
    @IBOutlet weak var SponsorSwitch: UISwitch!
    @IBAction func SoundChime(_ sender: Any) {
        if SoundChime.isOn{
            UserDefaults.standard.set(true, forKey: "SoundChime")
            
            //Bool
            
            print("SoundChime "+String(UserDefaults.standard.bool(forKey: "SoundChime")))
playSoundChime()
            SoundMusic.setOn(false, animated: false)
            UserDefaults.standard.set(false, forKey: "SoundMusic") //Bool



        }else{
                        UserDefaults.standard.set(false, forKey: "SoundChime") //Bool
            print("SoundChime "+String(UserDefaults.standard.bool(forKey: "SoundChime")))
stopSoundChime()


        }
        repeatNotification()
    

    }
    @IBAction func SoundMusic(_ sender: Any) {
         if SoundMusic.isOn{
            UserDefaults.standard.set(true, forKey: "SoundMusic") //Bool
            print("SoundMusic "+String(UserDefaults.standard.bool(forKey: "SoundMusic")))

            SoundChime.setOn(false, animated: false)
            UserDefaults.standard.set(false, forKey: "SoundChime") //Bool

            
playSoundMusic()
        }else{
                        UserDefaults.standard.set(false, forKey: "SoundMusic") //Bool
            
            print("SoundMusic "+String(UserDefaults.standard.bool(forKey: "SoundMusic")))
stopSoundMusic()

        }
        repeatNotification()
    }
    /*
    @IBAction func Vibrations(_ sender: Any) {
     
        if VibrationsSwitch.isOn{
            AudioServicesPlayAlertSound(kSystemSoundID_Vibrate);
            UserDefaults.standard.set(true, forKey: "Vibration") //Bool

        }else{
            UserDefaults.standard.set(false, forKey: "Vibration") //Bool

        }
    }
 */
    @IBAction func OnScreenNotifications(_ sender: Any) {
        
        if OnScreenNotificationsSwitch.isOn{
        print("default on")
            UserDefaults.standard.set(true, forKey: "Default Notification") //Bool
            

        let alert = DefaultNotificationAlert(title: "Default Notification", image: UIImage(named: "no_sponsor")!)
        
        alert.show(animated: true)
            SponsorSwitch.setOn(false, animated: false)
            UserDefaults.standard.set(false, forKey: "Sponsored Notification") //Bool
            UserDefaults.standard.set("", forKey: "Sponsored") //Bool

        }else{
            UserDefaults.standard.set(false, forKey: "Default Notification") //Bool

        }
        repeatNotification()
    }
    @IBAction func Sponsor(_ sender: Any) {
        if SponsorSwitch.isOn{
            UserDefaults.standard.set(true, forKey: "Sponsored Notification") //Bool

            print("default on")
            let alert = DefaultNotificationAlert(title: "Sponsored Notification", image: UIImage(named: "sponsor")!)
            
            alert.show(animated: true)
            OnScreenNotificationsSwitch.setOn(false, animated: false)
            UserDefaults.standard.set(false, forKey: "Default Notification") //Bool

        }
        else{
            UserDefaults.standard.set(false, forKey: "Sponsored Notification") //Bool
            UserDefaults.standard.set("", forKey: "Sponsored") //Bool

        }
        repeatNotification()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var soundMusic = UserDefaults.standard.bool(forKey: "SoundMusic")
        var chime = UserDefaults.standard.bool(forKey: "SoundChime")
        var SponsoredNotification = UserDefaults.standard.bool(forKey: "Sponsored Notification")
        var DefaultNotification = UserDefaults.standard.bool(forKey: "Default Notification")
        
        if(soundMusic){
            SoundMusic.setOn(true, animated: false)
        }
        if(chime){
            SoundChime.setOn(true, animated: false)
        }
        if(SponsoredNotification)
        {
            SponsorSwitch.setOn(true, animated: false)
        }
        if(DefaultNotification){
        
            OnScreenNotificationsSwitch.setOn(true, animated: false)
        }
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "background_settings.png")?.draw(in: self.view.bounds)
        
        if let image = UIGraphicsGetImageFromCurrentImageContext(){
            UIGraphicsEndImageContext()
            self.view.backgroundColor = UIColor(patternImage: image)
        }else{
            UIGraphicsEndImageContext()
            debugPrint("Image not available")
            
        }
        
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func printVariables(){

        var sponsor = UserDefaults.standard.string(forKey: "Sponsored")
        var soundMusic = UserDefaults.standard.bool(forKey: "SoundMusic")
        var SoundChime = UserDefaults.standard.bool(forKey: "SoundChime")
        var Vibration = UserDefaults.standard.bool(forKey: "Vibration")
        var SponsoredNotification = UserDefaults.standard.bool(forKey: "Sponsored Notification")
        var DefaultNotification = UserDefaults.standard.bool(forKey: "Default Notification")
        
        print("SoundMusic " + String(soundMusic) + "SoundCime " + String(SoundChime) + "Vibration "+String(Vibration) + "Sponsoerd Notification "+String(SponsoredNotification) + "Default Notification " + String(DefaultNotification))
        if let sponsorName = sponsor{
            print(" Sponsor is " + sponsor!)

        }
        
        
        let date = Date()
        let calendar = Calendar.current
        
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        let seconds = calendar.component(.second, from: date)
        print("hours = \(hour):\(minutes):\(seconds)")
        
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
