//
//  SettingsViewController.swift
//  GoldenRuleIOS
//
//  Created by user132771 on 3/23/18.
//  Copyright © 2018 JohnTuttle. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var SoundChime: UISwitch!
    @IBOutlet weak var SoundMusic: UISwitch!
    @IBOutlet weak var OnScreenNotificationsSwitch: UISwitch!
    @IBOutlet weak var VibrationsSwitch: UISwitch!
    @IBOutlet weak var SponsorSwitch: UISwitch!
    @IBAction func SoundChime(_ sender: Any) {
        
    }
    @IBAction func SoundMusic(_ sender: Any) {
    }
    @IBAction func Vibrations(_ sender: Any) {
    }
    @IBAction func OnScreenNotifications(_ sender: Any) {
    }
    @IBAction func Sponsor(_ sender: Any) {
    }
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
