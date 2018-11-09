//
//  ViewController.swift
//  Esprit4Launch
//
//  Created by selim mouelhi on 11/6/18.
//  Copyright © 2018 selim mouelhi. All rights reserved.
//

import UIKit

import GoogleSignIn
import FBSDKCoreKit
import FBSDKLoginKit
import FacebookCore
import FacebookLogin

class ViewController: UIViewController, GIDSignInUIDelegate,LoginButtonDelegate {
    func loginButtonDidCompleteLogin(_ loginButton: LoginButton, result: LoginResult) {
        print("connected")
    }
    
    func loginButtonDidLogOut(_ loginButton: LoginButton) {
        print("disconnected")
    }
    
    @IBOutlet weak var facebookbuttonview: UIButton!
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if error != nil
        {
            print(error)
            return
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    

    override func viewDidLoad() {

        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        GIDSignIn.sharedInstance()?.uiDelegate =  self
        let signinButton = GIDSignInButton(frame: CGRect(x: 0, y: 0, width: 250, height: 50))
        
        signinButton.center = view.center
        view.addSubview(signinButton)
        let fbBtn = LoginButton(readPermissions: [.publicProfile, .email])
        fbBtn.delegate = self as LoginButtonDelegate
        facebookbuttonview.addSubview(fbBtn)
        
    }


}

