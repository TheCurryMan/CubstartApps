//
//  ViewController.swift
//  Cubstart-Hello-World
//
//  Created by Avinash Jain on 10/2/19.
//  Copyright © 2019 Avinash Jain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var incrementButton: UIButton!
    
    var counter = 1
    
    @IBAction func buttonTapped(_ sender: Any) {
        print("Button tapped!")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        incrementButton.layer.cornerRadius = 10.0
    }
    
    @IBAction func incrementCounter(_ sender: Any) {
        counter = counter + 1
        counterLabel.text = "\(counter)"
    }
    


}

