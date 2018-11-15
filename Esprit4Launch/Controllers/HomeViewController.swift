//
//  HomeViewController.swift
//  Esprit4Launch
//
//  Created by selim mouelhi on 11/8/18.
//  Copyright © 2018 selim mouelhi. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var restaurants: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        restaurants.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapGesture))
        restaurants.addGestureRecognizer(tapGesture)
        

        // Do any additional setup after loading the view.
    }
    

    
    @objc func tapGesture()   {
        performSegue(withIdentifier: "goToMap", sender: nil)
        
    }
}
