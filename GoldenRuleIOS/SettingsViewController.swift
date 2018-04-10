//
//  SettingsViewController.swift
//  GoldenRuleIOS
//
//  Created by user132771 on 3/23/18.
//  Copyright
//

import UIKit
import AVFoundation


class SettingsViewController: UIViewController {
var player: AVAudioPlayer?

    
    func playSoundChime(){
         guard let url = Bundle.main.url(forResource: "chime", withExtension: "mp3") else { return }

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
        
    }
    func playSoundMusic(){
         guard let url = Bundle.main.url(forResource: "fur_elise", withExtension: "mp3") else { return }

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
        
    }
    func vibrate(){
                AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))            

    }
    @IBOutlet weak var SoundChime: UISwitch!
    @IBOutlet weak var SoundMusic: UISwitch!
    @IBOutlet weak var OnScreenNotificationsSwitch: UISwitch!
    @IBOutlet weak var VibrationsSwitch: UISwitch!
    @IBOutlet weak var SponsorSwitch: UISwitch!
    @IBAction func SoundChime(_ sender: Any) {
        if SoundChime.isOn{
            UserDefaults.standard.set(true, forKey: "SoundChime") //Bool
            print("SoundChime "+String(UserDefaults.standard.bool(forKey: "SoundChime")))
playSoundMusic()


        }else{
                        UserDefaults.standard.set(false, forKey: "SoundChime") //Bool
            print("SoundChime "+String(UserDefaults.standard.bool(forKey: "SoundChime")))
stopSoundMusic()


        }
    

    }
    @IBAction func SoundMusic(_ sender: Any) {
         if SoundMusic.isOn{
            UserDefaults.standard.set(true, forKey: "SoundMusic") //Bool
            print("SoundMusic "+String(UserDefaults.standard.bool(forKey: "SoundMusic")))

playSoundMusic()
        }else{
                        UserDefaults.standard.set(false, forKey: "SoundMusic") //Bool
            print("SoundMusic "+String(UserDefaults.standard.bool(forKey: "SoundMusic")))
stopSoundMusic()

        }
    }
    @IBAction func Vibrations(_ sender: Any) {
    }
    @IBAction func OnScreenNotifications(_ sender: Any) {
        
        if OnScreenNotificationsSwitch.isOn{
        print("default on")
        let alert = DefaultNotificationAlert(title: "Hello there!! 👋🏻👋🏻", image: UIImage(named: "background_settings.png")!)
        
        alert.show(animated: true)
        }
    }
    @IBAction func Sponsor(_ sender: Any) {
        if SponsorSwitch.isOn{
            print("default on")
            let alert = SponsoredNotificationAlert(title: "Hello there!! 👋🏻👋🏻", image: UIImage(named: "background_settings.png")!)
            
            alert.show(animated: true)
        }    }
    override func viewDidLoad() {
        super.viewDidLoad()
     
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
