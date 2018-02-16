//
//  SecondViewController.swift
//  GoldenRuleIOS
//
//  Created by user909394 on 12/27/17.
//  Copyright © 2017 JohnTuttle. All rights reserved.
//

import UIKit
import Firebase
class SecondViewController: UIViewController {

    var handle: AuthStateDidChangeListenerHandle?

    @IBOutlet weak var SignInButton: UIButton!
    @IBOutlet weak var CreateAccountButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

   override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    // [START auth_listener]
    handle = Auth.auth().addStateDidChangeListener { (auth, user) in
 
    }
  }
    
    
    @IBAction func createAccount(_ sender: Any) {
        createUser()
    }
    override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    // [START remove_auth_listener]
    Auth.auth().removeStateDidChangeListener(handle!)
    // [END remove_auth_listener]
  }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // [START create_user]
    func createUser(){
        Auth.auth().createUser(withEmail: "joseph.ios@ca.com", password: "ulc212976") { (user, error) in
                
              }
    }
    
        
    


}

