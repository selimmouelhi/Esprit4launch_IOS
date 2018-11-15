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
import Alamofire
import AlamofireImage

class ViewController: UIViewController,GIDSignInUIDelegate,GIDSignInDelegate {
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        if error != nil {
            print(error)
            print("ya 3aMENNES")
            
            return
        }
        else {print("no error")}
    }
    
    
   
    
    
    @IBAction func googleLogin(_ sender: Any) {
        GIDSignIn.sharedInstance()?.signIn()
        

    }
    
    func logoutSocial() {AccessToken.current = nil
        UserProfile.current = nil
        let loginManager = LoginManager()
        loginManager.logOut()
        GIDSignIn.sharedInstance()?.signOut()
    }
    
    @IBAction func facebookLogin(_ sender: Any) {
        
        let loginManager = LoginManager()
        loginManager.logIn(readPermissions: [.publicProfile, .email], viewController: self) { loginResult in
            switch loginResult {
            case .failed(let error):
                print("####################### ERROR #######################")
                print(error)
                self.showErrorAlert(title: "Sorry", message: "En error hase occured while trying to log you in, please try again.")
                break
            case .cancelled:
                print("failed")
                break
            case .success( _, _, _):
                self.fetchProfileFB()
                print("success")
                self.goToCategories()
                print(self.appDelegate!.utilisateur?.description)
                break
            }
        }
    }
    
   
    @IBOutlet weak var facebookSignInButton: UIButton!
    @IBOutlet weak var googleSignInButton: GIDSignInButton!
    let ClientId = "362625310410-fc0pii1j1dgsf4fbn9sp38en12lrq1m1.apps.googleusercontent.com"
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    //init(id:String,name:String,prenom:String,phone:Int,email:String)
    //imageUrl: (user.profile.imageURL(withDimension: 200)?.absoluteString)!
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if (error == nil) {
            
            self.appDelegate?.utilisateur = User(id: (self.appDelegate?.GOOGLE_UID_PREFIX)!+user.userID, name: user.profile.givenName, prenom: user.profile.familyName,email :user.profile.email )
           // checkSocialUserExistance()
             // change 2 to desired number of seconds
                
                print("success")
               // self.continueToHome()
            
        } else {
            print("error houni")
            print("\(error.localizedDescription)")
        }
    }
    func initGoogleButton() {
        googleSignInButton.backgroundColor = UIColor(displayP3Red: 221/255, green: 81/255, blue: 68/255, alpha: 1)
        googleSignInButton.tintColor = UIColor.white
        googleSignInButton.layer.cornerRadius = 13.0
    }
    
    func initFacebookButton() {
        facebookSignInButton.backgroundColor = UIColor(displayP3Red: 59/255, green: 89/255, blue: 153/255, alpha: 1)
        facebookSignInButton.tintColor = UIColor.white
        facebookSignInButton.layer.cornerRadius = 13.0
    }
    
    func fetchProfileFB() {
        let request = GraphRequest(graphPath: "me", parameters: ["fields": "id, email, first_name, last_name, picture.type(large)"])
        request.start { respons, result in
            switch result {
            case .failed(_):
                self.showErrorAlert(title: "Error", message: "Something went wrong, please try again.")
                break;
            case .success(let response):
                let dictionary = response.dictionaryValue
              /*  var imageUrl: String = ""
                if let picture = dictionary?["picture"] as? NSDictionary, let data = picture["data"] as? NSDictionary, let url = data["url"] as? String {
                    imageUrl = url
                }*/
                if let email = dictionary?["email"] as? String, let firstName = dictionary?["first_name"] as? String, let lastName = dictionary?["last_name"] as? String, let id = dictionary?["id"] as? String {
                    self.appDelegate!.utilisateur = User(id: (self.appDelegate?.FACEBOOK_UID_PREFIX)!+id, name: lastName, prenom: lastName, email: email)
                    self.addUserDB(user: self.appDelegate!.utilisateur!)
                }
                break;
            }
        }
        
    }
    //init(id:String,name:String,prenom:String,phone:Int,email:String)

    
    func showErrorAlert(title: String, message: String)  {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
    func goToCategories()  {
        performSegue(withIdentifier: "gotoCategories", sender: nil)
    }

    

    override func viewDidLoad() {

        super.viewDidLoad()
        
        
        GIDSignIn.sharedInstance()?.clientID = ClientId
        GIDSignIn.sharedInstance()?.delegate = self
        GIDSignIn.sharedInstance()?.uiDelegate = self
        
        initGoogleButton()
        initFacebookButton()
        
    }
    
    func addUserDB(user:User)  {
        
        
        
        
        let string1 = "http://localhost:3003/web_services/"
        let string2 = "\(user.prenom!)"
        let string3 = "&"
        let string4 = "\(user.nom!)"
        let string5 = "1996-08-04&"
        let string6 = "\(user.email!)"
        let string7 = string1 + string2 + string3 + string4 + string3 + string5 + string6
        
        print(string7 + "ahaya string")
        
      
        
        
        Alamofire.request(string7)
        
        
       
        
        
        
            
        
        

    }


}

