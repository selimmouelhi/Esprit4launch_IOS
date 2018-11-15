//
//  User.swift
//  Esprit4Launch
//
//  Created by selim mouelhi on 11/13/18.
//  Copyright © 2018 selim mouelhi. All rights reserved.
//

import Foundation


class User: NSObject {
    var id : Int?
    var nom : String?
    var prenom : String?
    var phone : Int?
    var email: String?
    var image_url :String?
    
    override init() {
        
    }
     init(name:String,prenom:String,email:String)
    {
        self.nom = name
        self.prenom = prenom
        self.email = email
       // self.image_url = image_url
        
    }
    init(name:String,prenom:String,phone:Int,email:String)
    {
        self.nom = name
        self.prenom = prenom
        self.phone = phone
        self.email = email
        // self.image_url = image_url
        
    }
    init(id:String,name:String,prenom:String,email:String)
    {
        self.id = Int(id)
        self.nom = name
        self.prenom = prenom
        self.email = email
        // self.image_url = image_url
        
    }
    override var description: String{
        return "User: {name: \(String(describing: nom)) , email: \(String(describing: email)) , prenom: \(String(describing: prenom)) , phone: \(String(describing: phone))  }"
    }
    
    
}
