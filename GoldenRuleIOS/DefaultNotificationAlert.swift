//
//  CustomAlertView.swift
//  GoldenRuleIOS
//
//  Created by user132771 on 4/6/18.
//  Copyright © 2018 JohnTuttle. All rights reserved.
//

import UIKit

//

class DefaultNotificationAlert: UIView, Modal {
    var backgroundView = UIView()
    var dialogView = UIView()
    
    
    convenience init(title:String,image:UIImage) {
        self.init(frame: UIScreen.main.bounds)
        initialize(title: title, image: image)
        
    }
    override init(frame: CGRect) {
         self.sponsorTextField=UITextField(frame: CGRect(x: 8, y: 38, width: frame.width-64-16, height: 30))
        self.sponsorLabel = UILabel(frame: CGRect(x:2, y: 1, width: 100, height: 30))
        self.sponsorLabel.font = UIFont(name: sponsorLabel.font.fontName,size: 12)

        self.sponsorLabel.layer.zPosition=1
        self.sponsorTextField.becomeFirstResponder()
        super.init(frame: frame)
       
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @IBAction func textFieldEditingDidChange(_ sender: Any) {
        print("textField: "+sponsorTextField.text!)

        sponsorLabel.text=sponsorTextField.text!
        
        //UserDefaults.standard.set(sponsorTextField.text, forKey: "Sponsored") //Bool

        
     
    }

    var sponsorTextField: UITextField
    var sponsorLabel: UILabel
    func initialize(title:String, image:UIImage){
        dialogView.clipsToBounds = true
        
        backgroundView.frame = frame
        backgroundView.backgroundColor = UIColor.black
        backgroundView.alpha = 0.6
        backgroundView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTappedOnBackgroundView)))
        addSubview(backgroundView)
        
        let dialogViewWidth = frame.width-64
        
        let titleLabel = UILabel(frame: CGRect(x: 8, y: 8, width: dialogViewWidth-16, height: 30))
        titleLabel.text = title
        titleLabel.textAlignment = .center
        dialogView.addSubview(titleLabel)
        
        
        sponsorTextField.textAlignment = .center
        sponsorTextField.placeholder="Enter sponsor"
        
        
        sponsorTextField.addTarget(self, action: #selector(textFieldEditingDidChange(_:)), for: UIControlEvents.editingChanged)
        
     
        
        
        
 
 
        let imageView = UIImageView()
        imageView.frame.origin = CGPoint(x: 8, y: sponsorTextField.frame.origin.y + sponsorTextField.frame.height+8)
        
        imageView.contentMode = .scaleAspectFill

        
        var widthOfImage,heightOfImage : CGFloat
        if(title == "Default Notification"){
            widthOfImage=dialogViewWidth-16
            heightOfImage = widthOfImage*74/320
        }else{
            widthOfImage=dialogViewWidth-16
            heightOfImage = widthOfImage*90/320
        }
       
        imageView.frame.size = CGSize(width: widthOfImage , height: heightOfImage)
        imageView.image = image
        imageView.layer.cornerRadius = 4
        imageView.clipsToBounds = true
        dialogView.addSubview(imageView)
        let dialogViewHeight = titleLabel.frame.height + 8 + imageView.frame.height + 8+sponsorTextField.frame.height+8

        sponsorLabel.frame.origin.y = dialogViewHeight/2+32

        sponsorLabel.frame.origin.x = (frame.width-64)/2
        dialogView.frame.origin = CGPoint(x: 32, y: frame.height)
        dialogView.frame.size = CGSize(width: frame.width-64, height: dialogViewHeight)
        dialogView.backgroundColor = UIColor.white
        dialogView.layer.cornerRadius = 6
        addSubview(dialogView)
        if(title != "Default Notification"){
            dialogView.addSubview(sponsorTextField)
            dialogView.addSubview(sponsorLabel)
        }
    }
    
    @objc func didTappedOnBackgroundView(){
        print("textField: "+sponsorTextField.text!)
        
        
        UserDefaults.standard.set(sponsorTextField.text, forKey: "Sponsored") //Bool

        dismiss(animated: true)
    }
    
}

