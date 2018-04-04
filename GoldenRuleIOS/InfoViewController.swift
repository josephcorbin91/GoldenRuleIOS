//
//  InfoViewController.swift
//  GoldenRuleIOS
//
//  Created by user132771 on 3/23/18.
//  Copyright © 2018 JohnTuttle. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class InfoViewController: UIViewController {
    @IBOutlet weak var VideoImage: UIButton!
    
    @IBOutlet weak var GoldenRulereminder: UILabel!
    
    
   @IBAction func ImageButton(_ sender: Any) {
         print("animation start ")
        let animationDuration=0.25
        UIView.animate(withDuration: animationDuration, animations: {
            self.VideoImage.alpha=0.0
            
        },completion: { (value: Bool) in
            self.playVideo()
            self.VideoImage.alpha=1.0
            print("animation end ")
            
        })
    }
       
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    
    private func playVideo(){
        guard let path = Bundle.main.path(forResource: "golden_rule_intro_video",ofType: "mp4") else {
            debugPrint("video.m4v not found")
            return
        }
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        let playerController = AVPlayerViewController()
        playerController.player=player
        present(playerController,animated: true){
            player.play()
        }
    }
    @objc func websiteLinkPressed(sender:UIGestureRecognizer){
        UIApplication.shared.canOpenURL(NSURL(string: "http://www.google.com")! as URL)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _ = UIGestureRecognizer(target: self, action: #selector(InfoViewController.websiteLinkPressed))
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "info_background.png")?.draw(in: self.view.bounds)
        
        if let image = UIGraphicsGetImageFromCurrentImageContext(){
            UIGraphicsEndImageContext()
            self.view.backgroundColor = UIColor(patternImage: image)
        }else{
            UIGraphicsEndImageContext()
            debugPrint("Image not available")
            
        }

        // Do any additional setup after loading the view.
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
