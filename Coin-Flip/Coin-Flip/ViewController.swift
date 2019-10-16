//
//  ViewController.swift
//  Coin-Flip
//
//  Created by Avinash Jain on 10/12/19.
//  Copyright © 2019 Avinash Jain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var isHeads = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func selectedHeads(_ sender: Any) {
        isHeads = true
        performSegue(withIdentifier: "coin", sender: self)
    }
    
    @IBAction func selectedTails(_ sender: Any) {
        isHeads = false
        performSegue(withIdentifier: "coin", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "coin" {
            let vc:CoinFlipViewController = segue.destination as! CoinFlipViewController
            vc.isHeads = self.isHeads
        }
    }
    
    
}

